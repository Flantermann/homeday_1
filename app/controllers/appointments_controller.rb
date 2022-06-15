class AppointmentsController < ApplicationController
  before_action :set_realtor, only: [:past, :future]

  def create
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
end
