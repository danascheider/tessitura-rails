FactoryGirl.define do
  factory :favorite do
    association :listing
    association :user
  end

end
