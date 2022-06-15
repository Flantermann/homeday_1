class Api::V1::AppointmentsController < ApplicationController
  before_action :set_realtor, only: [:past, :future]

  def create
    # MAYBE THIS SHOULD BE A SERVICE OBJECT
    # create new appointment
    appointment = Appointment.new(appointment_params)
    # if appointment.save (so if it passes all validations)
    if appointment.save
      # find closest realtor
      lat = appointment.lat
      lng = appointment.lng
      realtor = Realtor.within_radius(20_000, lat, lng).order_by_distance.first
      if realtor == nil
        # that means no realtor is working in the area
        # give meaningful error message
      else
        # still missing:
          # if realtor is found, then check for their availability (how?)
          # if realtor has appointment at appointment.time or in the 30 minutes before said time, they are not available
          # is no realtor is found: provide error message
        appointment.realtor = realtor #should this be an update of saved appointment instance?
      end
      seller = Seller.create(name: appointment.seller.name, phone: appointment.seller.phone)
      appointment.seller = seller
      render json: appointment, status: :created
    else
      # corresponding error message --> how?
    end
  end

  def past
    past_appointments = realtor.appointments.where(time: (Time.now.months_ago(1).beginning_of_month)..(Time.now.months_ago(1).end_of_month)).order(time: :desc)
    # better way to handle output?
    render json: past_appointments
  end

  def future
    future_appointments = realtor.appointments.where(time: (Time.now.beginning_of_month + 1.month)..(Time.now.beginning_of_month + 2.month - 1.day)).order(:time)
    # better way to handle output?
    render json: future_appointments
  end

  private

  def set_realtor
    realtor = Realtor.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:lat, :lng, :address, :time)
  end
end
