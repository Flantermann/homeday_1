class Seller < ApplicationRecord
  validates :name, :phone, presence: true
end
