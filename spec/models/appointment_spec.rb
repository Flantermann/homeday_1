require 'rails_helper'

# Test suite for the Appointment model
RSpec.describe Appointment, type: :model do

  subject {
    described_class.new(lat: 52.5019145,
                        lng: 13.4135005,
                        address: "Prinzessinnenstraße 26, 10969 Berlin",
                        time: Faker::Time.between(from: DateTime.now, to: DateTime.now + 5, format: :short),
                        seller_id: 1,
                        realtor_id: 1)
                      }

  it "is not valid without lat" do
    subject.lat = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without lng" do
    subject.lng = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without address" do
    subject.address = nil
    expect(subject).to_not be_valid
  end

  # needs test for validation of presence of time
  # needs tests for validations of timeframe (48 hours rule, weekday, 8-18h)

  # Association test
  describe 'associations' do
    it { should belong_to(:seller).class_name('Seller') }
  end
end
