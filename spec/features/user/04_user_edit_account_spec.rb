require 'rails_helper'

# As an authenticated user
# I want to update my information
# So that I can keep my profile up to date
#   [x] I must be sign in to see my edit profile link
#   [x] If I do not supply the required information, I receive an error

# As an authenticated user
# I want to delete my account
# So that my information is no longer retained by the app
#   [x] I must be signed in to see edit profile link
#   [x] I must go to edit profile page
#   [x] I must see a delete account link

feature "user edits their account" do

  before(:each) do
    @user = FactoryGirl.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Sign In'
    click_link 'My Account'
  end

  scenario "user can navigate to their Account Settings page" do
    expect(page).to have_content("Edit User")
  end

  scenario "user can edit first_name/last_name/username/email/password" do
    fill_in "First Name", with: "Ginny"
    fill_in "Last Name", with: "Weasley"
    fill_in "Username", with: "chaser6"
    fill_in "Email", with: "gw@hogwarts.edu"
    fill_in "New Password", with: "luvharry"
    fill_in "New Password Confirmation", with: "luvharry"
    fill_in "Current Password", with: @user.password
    click_button "Update"

    expect(page).to have_content "Your account has been updated successfully"
    click_link 'My Account'
    expect(find_field("First Name").value).to eq "Ginny"
    expect(find_field("Last Name").value).to eq "Weasley"
    expect(find_field("Username").value).to eq "chaser6"
    expect(find_field("Email").value).to eq "gw@hogwarts.edu"
    click_link 'Sign Out'
    click_link 'Sign In'

    fill_in 'Email', with: 'gw@hogwarts.edu'
    fill_in 'Password', with: 'luvharry'
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

  scenario "user can delete their account" do
    click_button "Cancel your account"
    expect(page).to have_content "Bye! Your account has been successfully cancelled. We hope to see you again soon."
    expect(User.all.length).to eq(0)
  end
end
