class HotelPhoneNumber < ApplicationRecord
  belongs_to :hotel, dependent: :destroy
end
