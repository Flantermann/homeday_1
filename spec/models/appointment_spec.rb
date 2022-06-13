require 'rails_helper'

# needs test for associations
# maybe write test to check if lat/lng correspond to correct address?

# Test suite for the Appointment model
RSpec.describe Appointment, type: :model do
  # Validation test

  subject {
    described_class.new(lat: 52.5019145,
                        lng: 13.4135005,
                        address: "Prinzessinnenstraße 26, 10969 Berlin",
                        time: Faker::Time.between(from: DateTime.now, to: DateTime.now + 5, format: :short)) }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

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

  it "is not valid without time" do
    subject.time = nil
    expect(subject).to_not be_valid
  end
end
