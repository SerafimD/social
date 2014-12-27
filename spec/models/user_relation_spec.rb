require 'rails_helper'

RSpec.describe UserRelation do
  it "has a valid factory" do
    expect(FactoryGirl.build(:user_relation)).to be_valid
  end

  it { should belong_to(:user_owner).class_name(User)}
  it { should belong_to(:user_rel).class_name(User)}

end
