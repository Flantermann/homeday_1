class AppointmentsController < ApplicationController
  before_action :set_realtor, only: [:past, :future]

  def create
    # create new seller from seller params
    # create new appointment @appointment = Appointment.new(appointment_params)
    # if appointment.save (so if it passes all validations)
      # look for closest realtor
    # if closest realtor is found
      # save seller
      # then save appointment
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
