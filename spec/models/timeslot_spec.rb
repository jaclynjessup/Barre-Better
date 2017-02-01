require 'rails_helper'

describe Timeslot, type: :model do
  it { should have_valid(:start_time).when('08:30:00') }
  it { should_not have_valid(:start_time).when(nil, '') }

  it { should have_valid(:end_time).when('09:30:00') }
  it { should_not have_valid(:end_time).when(nil, '') }
end
