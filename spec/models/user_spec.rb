require 'rails_helper'

RSpec.describe User, type: :model do
  context "when user data entered" do
    let(:user) { build :user } 
    
    it "should return true if all data is valid" do
      expect(user.valid?).to eq(true)
    end
  end
end
