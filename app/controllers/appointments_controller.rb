class AppointmentsController < ApplicationController
  before_action :set_realtor, only: [:past, :future]

  def create
    # MAYBE THIS SHOULD BE A SERVICE OBJECT
    # create new appointment @appointment = Appointment.new(appointment_params)
    # if appointment.save (so if it passes all validations)
      # look for closest realtor
      # lat = appointment.lat
      # lng = appointment.lng
      # realtor = Realtor.within_radius(20_000, lat, lng).order_by_distance.first
      # if realtor is found, then check for their availability (how?)
        # if realtor has appointment at appointment.time or int he 30 minutes before said time, they are not available
        # is no realtor is found: provide error message
          # if realtor == nil, return error message
    # if closest realtor is found and available
      # create new seller from seller params
      # seller = Seller.new(name: appointment.seller.name, phone: appointment.seller.phone)save seller
      # seller.save
      # then save appointment
    # appointment.realtor = realtor
    # appointment.seller = seller
    # return response
    # else: corresponding error message
  end

  def past
    @past_appointments = realtor.appointments.where(time: (Time.now.months_ago(1).beginning_of_month)..(Time.now.months_ago(1).end_of_month)).order(time: :desc)
    # how to handle output?
  end

  def future
    @future_appointments = realtor.appointments.where(time: (Time.now.beginning_of_month + 1.month)..(Time.now.beginning_of_month + 2.month - 1.day)).order(:time)
    # how to handle output?
  end

  private

  def set_realtor
    realtor = Realtor.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:lat, :lng, :address, :time)
  end
end
