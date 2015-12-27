FactoryGirl.define do
  factory :listing do
    title "Listing Title"
    description "Listing Description"

    factory :listing_with_deadline do 
      after(:create) do |listing, evaluator|
        create(:deadline, listing: listing)
      end
    end
  end

end
