FactoryGirl.define do
  factory :user do
    name {Faker::Name.name}
    email {Faker::Internet.email}
    password {Faker::Internet.password(20)}
    kind {Faker::Number.number(1)}
  end


  factory :user_owner, :class => User do
    name {Faker::Name.name}
    email {Faker::Internet.email}
    password {Faker::Internet.password(20)}
    kind {Faker::Number.number(1)}
  end


  factory :user_rel, :class => User do
    name {Faker::Name.name}
    email {Faker::Internet.email}
    password {Faker::Internet.password(20)}
    kind {Faker::Number.number(1)}
  end


end
