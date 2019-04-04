class Damage < ApplicationRecord
  belongs_to :room, dependent: :destroy
end
