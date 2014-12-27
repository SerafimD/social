require 'rails_helper'

RSpec.describe Community, :type => :model do
  it "has valid factory" do
    expect(FactoryGirl.build(:community)).to be_valid
  end

  it {should have_one(:user).class_name(User)}
end
