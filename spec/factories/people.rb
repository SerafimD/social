FactoryGirl.define do 
  factory :person do
    surename {Faker::Name.last_name}
    date_of_birth {Faker::Time.between(10000.days.ago,10000.days.ago)}
    association :user
  end

end
