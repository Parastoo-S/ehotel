class Chain < ApplicationRecord
  belongs_to :address, dependent: :destroy
  has_many :chain_emails
  has_many :chain_phone_numbers
  has_many :hotels

  accepts_nested_attributes_for :address
  validates_associated :address

  validates :name,
    presence: {message: "Please enter a name."},
    uniqueness: true

end
