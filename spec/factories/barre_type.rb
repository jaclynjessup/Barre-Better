FactoryGirl.define do
  factory :barre_type do
    sequence(:name) { Faker::Hipster.word }
    sequence(:description) { Faker::Hipster.paragraph }
  end
end
