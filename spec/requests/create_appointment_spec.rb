require 'rails_helper'

RSpec.describe "Appointments", type: :request do
  # the following requests should be tested:

  # it returns status code 201, if appointment was successfully created
  # test if data output is in correct format
  # it returns status code 422, if input is missing
  # it returns status code 422, if time is not in the right timeframe
  # it returns status code 422, if no realtor is found within radius of 20km
end
