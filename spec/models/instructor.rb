require 'rails_helper'

describe Instructor, type: :model do
  it { should have_valid(:full_name).when('Lily Potter') }
  it { should_not have_valid(:full_name).when(nil, '') }

  it { should have_valid(:bio).when('Lily is a muggle born wizard. She gav birth to The Boy Who Lived') }
  it { should_not have_valid(:bio).when(nil,'') }
end
