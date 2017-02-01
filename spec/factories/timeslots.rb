FactoryGirl.define do
  factory :timeslot do
    sequence(:start_time) { '12:00 PM' }
    sequence(:end_time) { '1:00 PM' }
  end
end
