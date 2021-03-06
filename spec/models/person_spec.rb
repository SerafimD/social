require 'rails_helper'

RSpec.describe Person do
  it "has a valid factory" do
    expect(FactoryGirl.build(:person)).to be_valid
  end

  it {should have_one(:user).class_name(User)}

end
