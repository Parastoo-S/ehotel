class ChainEmail < ApplicationRecord
  belongs_to :chain, dependent: :destroy
end
