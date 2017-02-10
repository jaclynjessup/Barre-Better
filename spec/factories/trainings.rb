FactoryGirl.define do
  factory :training do
    barre_type
    timeslot
    sequence(:date) { Faker::Date.between_except(Date.today, 1.year.from_now, 1.day.ago) }
    instructor
  end
end
