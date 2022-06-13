require 'rails_helper'

# Test suite for the Realtor model
RSpec.describe Seller, type: :model do
  # Validation test

  subject {
    described_class.new(name: Faker::Name.name,
                        phone: "+498005800550")
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a phone number" do
    subject.phone = nil
    expect(subject).to_not be_valid
  end

end
