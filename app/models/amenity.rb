class Amenity < ApplicationRecord
  belongs_to :room, dependent: :destroy
end
