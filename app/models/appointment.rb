class Appointment < ApplicationRecord
  acts_as_geolocated
  # validations
  validates :lat, :lng, :address, :time, presence: true
  # must validate time 48h in the future
  validates :after_48_hours
  # must validate weekday
  validates :is_weekday
  # must validate timeslot 8-18h
  validates :business_hours
  # associations
  belongs_to :seller
  belongs_to :realtor

  def after_48_hours
    if time.present? && time > Time.now && time.between?(Time.now, Time.now + (60*60*48))
      # can be refactored as "Time.now + 48.hours" I think
      errors.add(:time, "Appointment can't be scheduled in the next 48 hours")
    end
    # this shild actually check more, because Sat and Sun are not in the
    # 48 hours rule. So it should be more something like
    # f
  end

  def is_weekday
    if time.present? && time.saturday? || time.sunday?
      errors.add(:time, "Appointment can't be on the weekend")
    end
  end

  def business_hours
    if time.strftime('%H:%M').to_i < 8 || time.strftime('%H:%M').to_i > 18
      errors.add(:time, "Appointment must be scheduled between 8 and 18 h")
    end
  end
end
