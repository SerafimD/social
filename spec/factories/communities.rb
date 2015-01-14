FactoryGirl.define do
  factory :community do
    subject {Faker::Lorem.sentence}
    association :user, factory: :user_community
  end

end
