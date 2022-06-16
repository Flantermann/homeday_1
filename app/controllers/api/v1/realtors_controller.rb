class Api::V1::RealtorsController < ApplicationController
  before_action :set_realtor, only: [:past, :future]

  def past
    past_appointments = realtor.appointments.where(time: (Time.now.months_ago(1).beginning_of_month)..(Time.now.months_ago(1).end_of_month)).order(time: :desc)
    render json: past_appointments
  end

  def future
    future_appointments = realtor.appointments.where(time: (Time.now.beginning_of_month + 1.month)..(Time.now.beginning_of_month + 2.month - 1.day)).order(:time)
    render json: future_appointments
  end

  private

  def set_realtor
    realtor = Realtor.find(params[:id])
  end

end
