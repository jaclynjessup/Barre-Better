require 'rails_helper'

# As an authenticated user
# I want to un-sign up for a class
# So that I am not enrolled in that class
#   [] I must be signed in as a client
#   [] I must see all classes
#   [] I must see a cancel button on a class that I am signed up for

feature "client un-signs up for a class" do
  pending scenario "client un-signs up for a class they are signed up for" do
    training = FactoryGirl.create(:training)
    user = FactoryGirl.create(:user)
    visit '/'
    click_link 'Sign In'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    click_link 'Find a Class'

    expect(page).to have_content "Schedule"
    expect(page).to have_content training.name
  end
end
