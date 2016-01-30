require 'rails_helper'

RSpec.describe Author, :type => :model do
  it "should have a valid factory" do
    expect(FactoryGirl.create(:author)).to be_valid
  end
end
