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
    expect(page).to have_button "View Your Full History"
    expect(page).to have_content "You've taken 1 barre classes!"
    expect(page).to have_content "You're only 99 classes away from 100!"
    expect(page).to have_content "You're signed up for 0 more barre classes!"
  end

  scenario 'a new user sees their history' do
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
    expect(page).to have_button "View Your Full History"
    expect(page).to have_content "You've taken 0 barre classes!"
    expect(page).to have_content "You're only 100 classes away from 100!"
    expect(page).to have_content "You're signed up for 0 more barre classes!"
  end
end
