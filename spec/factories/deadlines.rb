FactoryGirl.define do
  factory :deadline do
    association :listing 

    date "2015-12-25"
    description "MyString"

    factory :upcoming_deadline do 
      sequence :date do |n|
        Date.today + (n + 1).days
      end
    end

    factory :past_deadline do 
      sequence :date do |n|
        Date.today - (n + 1).days
      end
    end
  end
end
