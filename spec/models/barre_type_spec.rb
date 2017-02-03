require 'rails_helper'

describe BarreType, type: :model do
  it { should have_valid(:name).when('Signature Barre') }
  it { should_not have_valid(:name).when(nil, "") }

  it { should have_valid(:description).when('Working mostly in full ranges of motion, our Signature class appeals to those who practice various exercise disciplines including Pilates, yoga, and even classical ballet.') }
  it { should_not have_valid(:description).when(nil, "") }
end
