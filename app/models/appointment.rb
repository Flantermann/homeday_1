class Appointment < ApplicationRecord
  validates :lat, :lng, :address, :time, presence: true
  # associations
  belongs_to :seller
  belongs_to :realtor
end
