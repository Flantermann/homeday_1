class Appointment < ApplicationRecord
  # validations
  validates :lat, :lng, :address, :time, presence: true
  # must validate time 48h in the future
  validates :after_48_hours
  # must validate weekday
  validates :is_weekday
  # must validate timeslot 8-18h
  # associations
  belongs_to :seller
  belongs_to :realtor

  def after_48_hours
    if time.present? && time > Time.now && time.between?(Time.now, Time.now + (60*60*48))
      errors.add(:time, "Appointment can't be scheduled in the next 48 hours")
    end
  end

  def is_weekday
    if time.present? && time.saturday? || time.sunday?
      errors.add(:time, "Appointment can't be on the weekend")
    end
  end
end
