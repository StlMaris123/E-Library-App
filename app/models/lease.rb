class Lease < ApplicationRecord
  enum status: { requested: 0, borrowed: 1, lost: 2 }
  belongs_to :user
  belongs_to :book
end
