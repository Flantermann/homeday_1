class Api::V1::AppointmentsController < ApplicationController

  def create
    # in a best case scenario, most of this should probably be transferred into a service object
    # create new appointment
    appointment = Appointment.new(appointment_params)
    seller = Seller.create(name: appointment.seller.name, phone: appointment.seller.phone)
    # here a search of the seller in the database could be added to check wether seller already exists
    appointment.seller = seller
    if appointment.save
      # if appointment.save (so if it passes all validations)
      # find closest realtor
      closest_realtor(appointment)
      if realtor == nil
        # that means no realtor is working in the area
        errors.add(:appointment, "no realtor available within 20km radius"), status: :unprocessable_entity
      else
        # realtor_has_conflicts?
        appointment.realtor = realtor
      end
      render json: appointment, status: :created
    else
      errors.add(:appointment), status: :unprocessable_entity
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:lat, :lng, :address, :time, :seller)
  end

  def closest_realtor(appointment)
    lat = appointment.lat
    lng = appointment.lng
    realtor = Realtor.within_radius(20_000, lat, lng).order_by_distance.first
  end

  # THIS METHOD IS NOT WORKING YET, NEEDS IMPROVEMENT
  # def realtor_has_conflicts?
  #   # if realtor is found, then check for their availability
  #   # can't have appointment at the time or in the 30 minutes before that
  #   realtor.appointments.each do |app|
  #     if app.time == appointment.time || (appointment.time - 30.minutes..appointment.time - 1.minute).include?(app.time)
  #       errors.add(:appointment, "closest realtor already has existing appointment"), status: :unprocessable_entity
  #     end
  #   end
  # end
end
