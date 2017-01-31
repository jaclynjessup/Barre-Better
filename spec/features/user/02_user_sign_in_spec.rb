require 'rails_helper'

# As an unauthenticated user
# I want to sign in
# So that I can view and signup for barre classes
#   [x] Home page must have sign in link
#   [x] I must enter in my email and password
#   [x] If I do not supply the required information, I receive an error

feature 'Sign in' do
  scenario 'an existing user specifies a valid email and password' do
    user = FactoryGirl.create(:user)
    visit '/'
    click_link 'Sign In'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    expect(page).to have_content("Welcome Back! It's time to Tuck!")
    expect(page).to have_content("Sign Out")
    expect(page).to_not have_content("Sign Up")
    expect(page).to_not have_content("Sign In")
    click_link 'Sign Out'
    expect(page).to have_content("Sign Up")
    expect(page).to have_content("Sign In")
    expect(page).to_not have_content("Sign Out")
  end

  scenario 'a nonexistant email and password is supplied' do
    visit '/'
    click_link 'Sign In'
    fill_in 'Email', with: 'noone@gmail.com'
    fill_in 'Password', with: 'iamnoone'
    click_button 'Sign In'
    expect(page).to have_content("Invalid Email or Password")
    expect(page).to_not have_content("Welcome Back! It's time to Tuck!")
    expect(page).to_not have_content("Sign Out")
    expect(page).to have_content("Sign In")
  end

  scenario 'an already authenticated user cannot re-sign in' do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    expect(page).to have_content("Sign Out")
    expect(page).to_not have_content("Sign Up")
    expect(page).to_not have_content("Sign In")

    visit new_user_session_path
    expect(page).to have_content("Why Barre Babe, You are already signed in.")
  end
end
