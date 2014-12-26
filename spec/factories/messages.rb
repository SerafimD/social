FactoryGirl.define do
  factory :message do
    body {Faker::Lorem.characters(rand(4..30)) }
  end

end
