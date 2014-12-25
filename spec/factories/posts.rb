FactoryGirl.define do
  factory :post do
    body { Faker::Lorem.characters(rand(4..30)) }
  end

end


