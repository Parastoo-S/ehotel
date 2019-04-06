class Chain < ApplicationRecord
  belongs_to :address, dependent: :destroy
  has_many :chain_emails, dependent: :destroy
  has_many :chain_phone_numbers, dependent: :destroy
  has_many :hotels, dependent: :destroy

  accepts_nested_attributes_for :address
  validates_associated :address

  validates :name,
    presence: {message: "Please enter a name."},
    uniqueness: true

end
