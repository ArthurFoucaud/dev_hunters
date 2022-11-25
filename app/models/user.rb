class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :devs
  has_many :bookings
  has_many :booked_devs, through: :bookings, source: :dev

  # validates :username, presence: true, uniqueness: true
  # validates :password, presence: true
end
