FactoryGirl.define do
  factory :user_relation do
    association :user_owner
    association :user_rel
  end


end
