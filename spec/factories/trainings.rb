FactoryGirl.define do
  factory :training do
    barre_type
    timeslot
    sequence(:date) { Faker::Date.between_except(1.year.ago, 1.year.from_now, Date.today) }
    instructor
  end
end
