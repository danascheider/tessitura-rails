FactoryGirl.define do 
  factory :user do 
    password "foobarbaz22"
    password_confirmation "foobarbaz22"
    first_name "User"
    last_name "Name"

    sequence :username do |n|
      "user2016#{n}"
    end
    
    sequence :email do |n|
      "user2016#{n}@example.com"
    end
  end
end