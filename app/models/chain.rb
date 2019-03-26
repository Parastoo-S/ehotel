class Chain < ApplicationRecord
  belongs_to :address, dependent: :destroy
  accepts_nested_attributes_for :address
  validates_associated :address

  validates :name,
    presence: {message: "Please enter a name."},
    uniqueness: true

end
