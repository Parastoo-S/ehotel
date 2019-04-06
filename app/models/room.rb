class Room < ApplicationRecord
  has_many :damages, dependent: :destroy
  has_many :amenities, dependent: :destroy
  has_many :bookings, dependent: :destroy
  belongs_to :hotel
  has_one :address, through: :hotel

  accepts_nested_attributes_for :damages
  validates_associated :damages

  accepts_nested_attributes_for :amenities
  validates_associated :amenities

  scope :is_located, ->(city){ joins(:address).where(addresses:{ city: city }) }
  scope :has_capacity, ->(capacity){where('capacity >= ?', capacity)}

end
