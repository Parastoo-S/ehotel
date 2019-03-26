class Chain < ApplicationRecord
  belongs_to :address, dependent: :destroy

  validates :name,
    presence: {message: "Please enter a name."}
    uniqueness: true

end
