FactoryGirl.define do 
  factory :user do 
    password "foobarbaz22"
    password_confirmation "foobarbaz22"
    first_name "User"
    last_name "Name"
        
    sequence :email do |n|
      "user2016#{n}@example.com"
    end

    factory :user_with_tasks do 
      transient do 
        count 4
      end

      after(:create) do |user, evaluator|
        FactoryGirl.create_list(:task, evaluator.count, :user_id => user.id)
      end
    end
  end
end