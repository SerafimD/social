FactoryGirl.define do
  factory :user_relation do
    association :user_owner, factory: :user
    association :user_rel, factory: :user
  end


end
