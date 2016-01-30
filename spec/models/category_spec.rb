require 'rails_helper'

RSpec.describe Category, :type => :model do
  it "should have a valid factory" do
    expect(FactoryGirl.create(:category)).to be_valid
  end
end
