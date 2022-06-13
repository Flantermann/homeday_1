class Realtor < ApplicationRecord
   validates :name, :city, :lat, :lng, presence: true
   has_many :appointments, dependent: :destroy
end
