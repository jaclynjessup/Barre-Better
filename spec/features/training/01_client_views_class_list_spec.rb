require 'rails_helper'

# As an authenticated client
# I want to view all of the classes
# So that I can see what class I want to take
#   [x] I must be signed in to view classes
#   [] I will see a list of all classes from today on
#   [] I will not see a sign-up for classes that has passed

feature "client visits class index page" do
  scenario "client can see list of classes" do
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
    expect(page).to have_content training.instructor.full_name
    expect(page).to have_content training.date.strftime("%B %d %Y")
    expect(page).to have_content training.timeslot.start_time
    expect(page).to have_content training.timeslot.end_time
  end
end
