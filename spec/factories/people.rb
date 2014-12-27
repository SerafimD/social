FactoryGirl.define do 
  factory :person do
    surename {Faker::Name.last_name}
    date_of_birth {Faker::Time.between(10000.days.ago,10000.days.ago)}
    #user_id { Factory(:user)}
    #user
    association :user
  end

end
