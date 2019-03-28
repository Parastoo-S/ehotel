class Hotel < ApplicationRecord
  belongs_to :chain, dependent: :destroy
  belongs_to :address, dependent: :destroy
end
