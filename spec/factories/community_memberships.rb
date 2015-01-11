FactoryGirl.define do
  factory :community_membership do
    association :community, factory: :community
    association :user, factory: :user
  end

end
