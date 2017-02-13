require 'rails_helper'

# As an authenticated user
# I want to sign in
# So that I can view my class history
#   [x] Successful log-in will display user history

feature 'Sign in to view History' do
  scenario 'an existing user sees their history' do
    user = FactoryGirl.create(:user)
    training3 = FactoryGirl.create(:training, date: "2015-03-03")
    userhistory = FactoryGirl.create(:user_history, user: user, training: training3)
    visit '/'
    click_link 'Sign In'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    expect(page).to have_content("Welcome Back! It's time to Tuck!")
    expect(page).to have_content("Welcome Back to Barre Better!")
    click_button "View Your Full History"

    expect(page).to have_content user.first_name
    expect(page).to have_content user.last_name
    expect(page).to have_content("Class History")
    expect(page).to have_content("Total Barre Classes")
    expect(page).to have_content("Barre Classes By Day Of The Week")
    expect(page).to have_content("Barre Classes By Instructor")
    expect(page).to have_content("Barre Classes By Time")
    expect(page).to have_content training3.barre_type.name
    expect(page).to have_content training3.instructor.full_name
    expect(page).to have_content training3.date.strftime("%B %d %Y")
    expect(page).to have_content training3.timeslot.start_time
    expect(page).to have_content training3.timeslot.end_time
  end

  scenario 'a new user sees their history' do
    training3 = FactoryGirl.create(:training, date: "2015-03-03")
    visit '/'
    click_link 'New? Sign Up'

    fill_in 'First Name', with: 'Heromine'
    fill_in 'Last Name', with: 'Granger'
    fill_in 'Username', with: 'leviOsa'
    fill_in 'Email', with: 'hg@hogwarts.com'
    fill_in 'Password', with: 'gryffindor'
    fill_in 'Confirm Password', with: 'gryffindor'
    click_button 'Sign Up'
    expect(page).to have_content("Welcome to Barre Better! You Have Successfully Signed Up.")
    expect(page).to have_content("Welcome Back to Barre Better!")
    click_button "View Your Full History"

    expect(page).to have_content("Heromine Granger's Profile")
    expect(page).to have_content("Class History")
    expect(page).to have_content("Total Barre Classes")
    expect(page).to have_content("Barre Classes By Day Of The Week")
    expect(page).to have_content("Barre Classes By Instructor")
    expect(page).to have_content("Barre Classes By Time")
    expect(page).to_not have_content training3.barre_type.name
    expect(page).to_not have_content training3.instructor.full_name
    expect(page).to_not have_content training3.date.strftime("%B %d %Y")
    expect(page).to_not have_content training3.timeslot.start_time
    expect(page).to_not have_content training3.timeslot.end_time
  end
end
