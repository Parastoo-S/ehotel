class Booking < ApplicationRecord
  belongs_to :hotel, dependent: :destroy
end
