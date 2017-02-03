FactoryGirl.define do
  factory :timeslot do
    sequence(:start_time) { |n| "12:0#{n} PM" }
    sequence(:end_time) { |n| "1:0#{n} PM" }
  end
end
