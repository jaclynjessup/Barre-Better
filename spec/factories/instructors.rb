FactoryGirl.define do
  factory :instructor do
    sequence(:full_name) { Faker::HarryPotter.name }
    sequence(:bio) { Faker::HarryPotter.quote }
  end
end
