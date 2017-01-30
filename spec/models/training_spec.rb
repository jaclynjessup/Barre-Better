require 'rails_helper'

describe Training, type: :model do
  time = FactoryGirl.create(:timeslot)
  instructor = FactoryGirl.create(:user, role: "instructor")
  timeslot = FactoryGirl.create(:timeslot)


  it { should have_valid(:name).when('Barre') }
  it { should_not have_valid(:name).when(nil, "") }

  it { should have_valid(:date).when('13/07/2013') }
  it { should_not have_valid(:date).when(nil, "") }

  it { should belong_to(:timeslot) }

  it { should have_valid(:timeslot).when(timeslot) }
  it { should_not have_valid(:timeslot).when(nil) }

  after(:all) {User.destroy_all}
end
