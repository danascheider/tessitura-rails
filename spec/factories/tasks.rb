FactoryGirl.define do
  factory :task do
    association :user
    
    title "MyString"
    position 1

    factory :task_with_deadline do 
      after(:create) do |task, evaluator|
        FactoryGirl.create(:deadline, task: task)
      end
    end
  end

end
