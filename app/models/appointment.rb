class Appointment < ApplicationRecord
  acts_as_geolocated
  # validations
  validates :lat, :lng, :address, :time, presence: true
  # must validate appropriate hours to appointment
  validate :hours_to_appointment
  # must validate weekday
  validate :is_weekday
  # must validate timeslot 8-18h
  validate :business_hours
  # associations
  belongs_to :seller, optional: true # do I need optional? If not, get rid of it
  belongs_to :realtor, optional: true # do I need optional? If not, get rid of it

  private

  def hours_to_appointment
    day_of_week = Time.now.wday

    if time.present? && time > Time.now
      # if today is Sunday, Monday, Tuesday or Wednesday:
      # appointment must be 48 hours in the future
      if day_of_week.wday == 0 || day_of_week.wday == 1 || day_of_week.wday == 2 || day_of_week.wday == 3
        if time.between?(Time.now, Time.now + (60*60*48))
          errors.add(:time, "Appointment can't be scheduled in the next 48 hours, excluding weekends")
        end
      # if today is Thursday:
      # appointment can't be before Monday
      elsif day_of_week.wday == 4
        if time.between?(Time.now, Time.now + (60*60*96))
          errors.add(:time, "Appointment can't be scheduled in the next 48 hours, excluding weekends")
        end
      # if today is Friday or Saturday:
      # appointment can't be before Tuesday
      elsif day_of_week.wday == 5 || day_of_week.wday == 6
        if time.between?(Time.now, Time.now + (60*60*120))
          errors.add(:time, "Appointment can't be scheduled in the next 48 hours, excluding weekends")
        end
      end
    end
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
    # it would probably need some time zoning here
  end
end
