require 'rails_helper'

# Test suite for the Realtor model
RSpec.describe Realtor, type: :model do
  # Validation test
  # ensure column name is present before saving
  it { should validate_presence_of(:name) }
end
