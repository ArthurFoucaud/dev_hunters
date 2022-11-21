class Dev < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, presence: true
  validates :available, default: false
end
