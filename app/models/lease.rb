class Lease < ApplicationRecord
  enum status: { borrowed: 0, lost: 1}
  belongs_to :user
  belongs_to :book
end
