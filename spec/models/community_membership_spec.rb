require 'rails_helper'

RSpec.describe CommunityMembership do
  it "has a valid factory" do
    expect(FactoryGirl.build(:community_membership)).to be_valid
  end

  it {should belong_to(:user).class_name(User)}
  it {should belong_to(:community).class_name(Community)}
end
