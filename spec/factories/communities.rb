FactoryGirl.define do
  factory :community do
    subject {Faker::Lorem.sentence}
    association :user
  end

end
