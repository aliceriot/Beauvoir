require 'rails_helper'

RSpec.describe Publisher, :type => :model do
  it "should have a valid factory" do
    expect(FactoryGirl.create(:publisher)).to be_valid
  end
end
