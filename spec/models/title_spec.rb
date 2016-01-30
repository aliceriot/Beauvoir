require 'rails_helper'

RSpec.describe Title, :type => :model do
  it "should have a valid factory" do
    expect(FactoryGirl.create(:title)).to be_valid
  end
end
