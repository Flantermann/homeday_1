class Appointment < ApplicationRecord
  validates :lat, :lng, :address, :time, presence: true
end
