module SessionsHelper
  #Logs in the given user
  def log_in(user)
    session[:user_id] = user.id
  end
  #Remembers a user in a persistent session
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
    # cookies[:remember_token] = { value: remember_token,
    # expires: 7.days.from_now.eat}
  end

  #returns true if the given user is the current user
  module SessionsHelper
    #Logs in the given user
    def log_in(user)
      session[:user_id] = user.id
    end
    #Remembers a user in a persistent session
    def remember(user)
      user.remember
      cookies.permanent.signed[:user_id] = user.id
      cookies.permanent[:remember_token] = user.remember_token
    end

    #returns true if the given user is the current user
    def current_user?(user)
      user == current_user
    end
    #Returns the user corresponding to the remember token cookie
    def current_user
      if (user_id = session[:user_id])
        @current_user ||= User.find_by(id: user_id)
      elsif (user_id = cookies.signed[:user_id])
        user = User.find_by(id: user_id)
        if user && user.authenticated?(cookies[:remember_token])
          log_in user
          @current_user = user
        end
      end
    end
    def logged_in?
      !current_user.nil?
    end

    #forgets a persistent session
    def forget(user)
      user.forget
      cookies.delete(:user_id)
      cookies.delete(:remember_token)
    end

    #logs out the current user
    def log_out
      forget(current_user)
      session.delete(:user_id)
      @current_user = nil
    end
  end
  def current_user?(user)
    user == current_user
  end
  #Returns the user corresponding to the remember token cookie
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(:remember, cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end
  def logged_in?
    !current_user.nil?
  end

  #forgets a persistent session
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  #logs out the current user
  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end
  #Redirects to stored location(or the default location)
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwwarding_url)
  end
  def store_location
    session[:forwarding_url] = request.url if request.get?
  end
  def admin_user?
    true
  end

end
