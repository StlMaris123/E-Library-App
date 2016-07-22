class Book < ApplicationRecord
  has_many :users
  has_many :leases
  enum status: {available: 0, unavailable: 1}
 validates :ISBN, presence: true, length: { minimum: 8 }, numericality: { greater_than_or_equal_to: 1 }, uniqueness: true
 validates :title, presence: true
 validates :description, presence: true
 validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 1 }
end
