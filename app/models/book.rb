class Book < ApplicationRecord
 validates :ISBN, presence: true, length: { minimum: 8 }, numericality: { greater_than_or_equal_to: 1 }
 validates :title, presence: true
 validates :description, presence: true
 validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 1 }
end
