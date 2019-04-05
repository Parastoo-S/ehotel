class Booking < ApplicationRecord
  belongs_to :room

  validates :check_in,
    presence: {message: "Please enter the check-in date."}

  validates :check_out,
    presence: {message: "Please enter the check-out date."}


end
