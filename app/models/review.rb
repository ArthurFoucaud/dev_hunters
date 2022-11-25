class Review < ApplicationRecord
  belongs_to :dev
  belongs_to :user
end
