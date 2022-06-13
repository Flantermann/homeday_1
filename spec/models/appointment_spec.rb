require 'rails_helper'

# wie schreibe ich den Test für die "is valid with valid attributes" um,
# jetzt wo ich die associations habe? Da werden jetzt als attributes ja auch seller_id
# und realtor_id erwartet. Aber ich kann da ja nicht einfach
# irgendeine ID reinschreiben, oder? --> Nee, das funktioniert nicht
# wie kann man dann das dann regeln?
# vielleicht ist das ein Fall für FactoryBot?
# maybe write test to check if lat/lng correspond to correct address?

# Test suite for the Appointment model
RSpec.describe Appointment, type: :model do
  # Validation test

  # alternative shoulda-syntax, but output is " is expected to..."
  # describe 'validations' do
  #   it { should validate_presence_of(:lat) }
  #   it { should validate_presence_of(:lng) }
  #   it { should validate_presence_of(:address) }
  #   it { should validate_presence_of(:time) }
  # end

  subject {
    described_class.new(lat: 52.5019145,
                        lng: 13.4135005,
                        address: "Prinzessinnenstraße 26, 10969 Berlin",
                        time: Faker::Time.between(from: DateTime.now, to: DateTime.now + 5, format: :short),
                        seller_id: 1,
                        realtor_id: 1)
                      }

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

  # Association test
  describe 'associations' do
    it { should belong_to(:seller).class_name('Seller') }
    it { should belong_to(:realtor).class_name('Realtor') }
  end
end
