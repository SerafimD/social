require 'rails_helper'

RSpec.describe Post, :type => :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:post)).to be_valid
  end

  it {should belong_to(:user).class_name(User)}
end
