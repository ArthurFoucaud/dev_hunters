class Booking < ApplicationRecord
  belongs_to :dev
  belongs_to :user

  validates :status_seller, default: 'pending'
end
