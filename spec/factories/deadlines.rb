FactoryGirl.define do
  factory :deadline do
    association :listing 

    date "2015-12-25"
    description "MyString"
  end

end
