require 'rails_helper'

# As an authenticated user
# I want to sign out
# So that no one else can signup for barre classes on my behalf
#   [] Page must have sign out link when user is signed in
#   [] Page should not have a sign up link'

feature 'Sign Out' do
  scenario 'user signs out' do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link 'Sign In'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'
    expect(page).to have_content("Welcome Back! It's time to Tuck!")
    expect(page).to have_content("Sign Out")
    click_link 'Sign Out'
    expect(page).to have_content("Signed out successfully. See You At The Barre!")
    expect(page).to have_content("Sign In")
  end
end
