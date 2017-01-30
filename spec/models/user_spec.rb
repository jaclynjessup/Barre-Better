require 'rails_helper'

describe User, type: :model do
  it { should have_valid(:first_name).when('heromine', 'harry') }
  it { should_not have_valid(:first_name).when(nil, '') }

  it { should have_valid(:last_name).when('weasley', 'potter') }
  it { should_not have_valid(:last_name).when(nil, '') }

  it { should have_valid(:username).when('harry77', 'ron10') }
  it { should_not have_valid(:username).when(nil, '') }

  it { should have_valid(:email).when('user@example.com', 'barre@gmail.com') }
  it { should_not have_valid(:email).when(nil, '', 'user', 'mail@com', '.com', 'barre@gmail') }

  it 'has a matching password confirmation for the password' do
    user = User.new
    user.password = 'password'
    user.password_confirmation = 'wrongpassword'

    expect(user).to_not be_valid
    expect(user.errors[:password_confirmation]).to_not be_blank
  end
end
