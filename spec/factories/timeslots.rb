FactoryGirl.define do
  factory :timeslot do
    sequence(:start_time) { 1.hour.ago }
    sequence(:end_time) { Time.now }
  end
end
