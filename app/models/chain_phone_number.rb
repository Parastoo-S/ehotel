class ChainPhoneNumber < ApplicationRecord
  belongs_to :chain, dependent: :destroy
end
