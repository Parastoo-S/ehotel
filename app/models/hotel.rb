class Hotel < ApplicationRecord
  belongs_to :chain
  belongs_to :address

  has_many :hotel_phone_numbers, dependent: :destroy
  has_many :rooms, dependent: :destroy

  accepts_nested_attributes_for :address
  validates_associated :address

end
