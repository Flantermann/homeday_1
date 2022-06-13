require 'rails_helper'

# Test suite for the Realtor model
RSpec.describe Realtor, type: :model do
  # Validation test

  subject {
    described_class.new(name: Faker::Name.name,
                        city: Faker::Address.city,
                        lat: Faker::Address.latitude,
                        lng: Faker::Address.longitude)
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a city" do
    subject.city = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without latitude" do
    subject.lat = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without longitude" do
    subject.lng = nil
    expect(subject).to_not be_valid
  end
end
