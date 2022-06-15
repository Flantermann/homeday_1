class Realtor < ApplicationRecord
  acts_as_geolocated
  validates :name, :city, :lat, :lng, presence: true
  has_many :appointments, dependent: :destroy
end
