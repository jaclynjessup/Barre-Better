FactoryGirl.define do
  factory :instructor do
    sequence(:full_name) { |n| "fullname#{n}" }
    sequence(:bio) { Faker::Hipster.paragraph(2) }
  end
end
