class Room < ApplicationRecord
  has_many :damages, dependent: :destroy
  has_many :amenities, dependent: :destroy
  has_many :bookings, dependent: :destroy
  belongs_to :hotel

  accepts_nested_attributes_for :damages
  validates_associated :damages

  accepts_nested_attributes_for :amenities
  validates_associated :amenities

end
