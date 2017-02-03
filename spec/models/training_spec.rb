require 'rails_helper'

describe Training, type: :model do
  time = FactoryGirl.create(:timeslot)
  instructor = FactoryGirl.create(:instructor)
  timeslot = FactoryGirl.create(:timeslot)
  barretype = FactoryGirl.create(:barre_type)

  it { should belong_to(:barre_type) }

  it { should have_valid(:barre_type).when(barretype) }
  it { should_not have_valid(:barre_type).when(nil) }

  it { should have_valid(:date).when('13/07/2013') }
  it { should_not have_valid(:date).when(nil, "") }

  it { should belong_to(:timeslot) }

  it { should have_valid(:timeslot).when(timeslot) }
  it { should_not have_valid(:timeslot).when(nil) }

  it { should belong_to(:instructor) }

  it { should have_valid(:instructor).when(instructor) }
  it { should_not have_valid(:instructor).when(nil) }

end
