class User < ApplicationRecord
  require 'AfricasTalkingGateway'
  has_many :books, through: :leases
  has_many :leases
  attr_accessor :remember_token, :activation_token, :reset_token
  before_save   :downcase_email
  before_create :create_activation_digest
  validates :name, presence: true, length:{ maximum: 50 }
  validates :mobile_number, presence: true, length: { minimum: 10 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 250},
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }, allow_blank: true

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
      BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  #returns a random token
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  #remembers a user in the database for use in persistent sessions
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end
  #Returns true if the given token matches the digest
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end
  def activate
    update_attribute(:activated, true)
    update_attribute(:activated_at, Time.zone.now)
  end
  #ends activation email
  # def send_activation_email
  #   UserMailer.account_activation(self).deliver_now
  # end

  #sets the password resets attributes
  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest, User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  #sends password reset email
  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  def send_request_approval
    UserMailer.request_approval(self).deliver_now
  end
  #forgets a user
  def forget
    update_attribute(:remember_digest, nil)
  end
  #returns true if password reset hass expired
  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end
  def send_sms(message)
    username = ENV['MY_USERNAME']
    apikey = ENV['MY_API']
    gateway = AfricasTalkingGateway.new(username, apikey)
    begin
      reports = gateway.sendMessage(self.mobile_number, message)
      reports.each {|x|
        # status is either "Success" or "error message"
        puts 'number=' + x.number + ';status=' + x.status + ';messageId=' + x.messageId + ';cost=' + x.cost
      }
    rescue AfricasTalkingGatewayException => ex
      puts 'Encountered an error: ' + ex.message
    end
  end
  private
  #converts email to all lower_case
  def downcase_email
    self.email = email.downcase
  end

  #creates and assigns the activation token and digest
  def create_activation_digest
    self.activation_token = User.new_token
    self.activation_digest = User.digest(activation_token)
  end
end

