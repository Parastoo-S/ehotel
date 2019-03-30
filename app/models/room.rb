class Room < ApplicationRecord
  has_many :damages
  has_many :amenities
  belongs_to :hotel

  accepts_nested_attributes_for :damages
  validates_associated :damages

  accepts_nested_attributes_for :amenities
  validates_associated :amenities

end
