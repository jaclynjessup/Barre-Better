require 'rails_helper'

# As an authenticated client
# I want to view all of the classes
# So that I can see what class I want to take
#   [x] I must be signed in to view classes

feature "client visits class index page" do
  scenario "client can see list of classes" do
    training0 = FactoryGirl.create(:training)
    user = FactoryGirl.create(:user)
    visit '/'
    click_link 'Sign In'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    click_link 'Find a Class'

    expect(page).to have_content "Schedule"
    expect(page).to have_content training0.barre_type.name
    expect(page).to have_content training0.instructor.full_name
    expect(page).to have_content training0.date.strftime("%B %d %Y")
    expect(page).to have_content training0.timeslot.start_time
    expect(page).to have_content training0.timeslot.end_time
  end

  scenario "client cannot see classes unless signed in" do
    training2 = FactoryGirl.create(:training)
    user = FactoryGirl.create(:user)
    visit '/'

    click_link 'Find a Class'

    expect(page).to have_content "Sign In"
    expect(page).to_not have_content "Schedule"
  end
end
