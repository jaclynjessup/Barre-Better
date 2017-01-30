FactoryGirl.define do
  factory :training do
    sequence(:name) { |n| "name#{n}" }
    timeslot
    sequence(:date) { 3.days.ago }
    user
  end
end
