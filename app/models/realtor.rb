class Realtor < ApplicationRecord
   validates :name, :city, :lat, :lng, presence: true
end
