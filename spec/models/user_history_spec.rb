require 'rails_helper'

describe UserHistory, type: :model do
  user = FactoryGirl.create(:user)
  training = FactoryGirl.create(:training)

  it { should belong_to(:user) }

  it { should have_valid(:user).when(user) }
  it { should_not have_valid(:user).when(nil) }

  it { should belong_to(:training)}

  it { should have_valid(:training).when(training) }
  it { should_not have_valid(:training).when(nil) }
end
