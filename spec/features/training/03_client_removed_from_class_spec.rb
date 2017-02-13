require 'rails_helper'

# As an authenticated user
# I want to un-sign up for a class
# So that I am not enrolled in that class
#   [x] I must be signed in as a client
#   [x] I must see all classes
#   [x] I must see a cancel button on a class that I am signed up for

feature "client un-signs up for a class" do
  scenario "client un-signs up for a class they are signed up for" do
    training = FactoryGirl.create(:training)
    user = FactoryGirl.create(:user)
    userhistory = FactoryGirl.create(:user_history, user: user, training: training)
    visit '/'
    click_link 'Sign In'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    click_link 'Find a Class'

    expect(page).to have_content "Schedule"
    expect(page).to have_content training.barre_type.name

    page.find(:css, ".show-#{training.id}")
    visit training_path(training)

    expect(page).to have_content training.barre_type.name
    expect(page).to have_content training.instructor.full_name
    expect(page).to have_content training.date.strftime("%B %d %Y")
    expect(page).to have_content training.timeslot.start_time
    expect(page).to have_content training.timeslot.end_time
    click_button "Unreserve"
    expect(page).to have_content "We're sorry you can't join us at the barre."
  end

  scenario "client should not see Unreserve for a class they aren't enrolled in" do
    training = FactoryGirl.create(:training)
    user = FactoryGirl.create(:user)
    visit '/'
    click_link 'Sign In'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    click_link 'Find a Class'

    expect(page).to have_content "Schedule"
    expect(page).to have_content training.barre_type.name

    page.find(:css, ".show-#{training.id}")
    visit training_path(training)

    expect(page).to have_content training.barre_type.name
    expect(page).to have_content training.instructor.full_name
    expect(page).to have_content training.date.strftime("%B %d %Y")
    expect(page).to have_content training.timeslot.start_time
    expect(page).to have_content training.timeslot.end_time

    expect(page).to_not have_button "Unreserve"
  end
end
