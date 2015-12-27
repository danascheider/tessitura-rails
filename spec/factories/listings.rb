FactoryGirl.define do
  factory :listing do
    title "Listing Title"
    description "Listing Description"

    factory :listing_with_deadline do 
      after(:create) do |listing, evaluator|
        create(:deadline, listing: listing)
      end
      
      factory :listing_with_all_attributes do
        minimum_age 18
        maximum_age 25
      end
    end
  end

end
