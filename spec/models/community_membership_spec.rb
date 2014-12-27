require 'rails_helper'

RSpec.describe CommunityMembership do
  it "has a valid factory" do
    expect(FactoryGirl.build(:community_membership)).to be_valid
  end
end
