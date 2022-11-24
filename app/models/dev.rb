class Dev < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  has_one_attached :photo

  validates :name, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def self.search(keywords)
    if keywords
      where("name LIKE ? OR address LIKE ? OR skill LIKE ?", "%#{keywords}%", "%#{keywords}%", "%#{keywords}%").order('id DESC')
    else
      order('id DESC')
    end
  end
end
