class Book < ApplicationRecord
 validates :ISBN, presence: true
 validates :title, presence: true
 validates :description, presence: true
 validates :quantity, presence: true
end
