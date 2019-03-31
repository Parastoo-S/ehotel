class Hotel < ApplicationRecord
  belongs_to :chain, dependent: :destroy
  belongs_to :address, dependent: :destroy
  has_many :hotel_phone_numbers

  accepts_nested_attributes_for :address
  validates_associated :address

end
