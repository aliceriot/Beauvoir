require 'rails_helper'

RSpec.describe Edition, :type => :model do
  it "should have a valid factory" do
    expect(FactoryGirl.create(:edition)).to be_valid
  end
end
