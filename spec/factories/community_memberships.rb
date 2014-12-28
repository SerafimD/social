FactoryGirl.define do
  factory :community_membership do
    association :community
    association :user
  end

end
