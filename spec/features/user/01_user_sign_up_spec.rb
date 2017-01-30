require 'rails_helper'

# As a prospective user
# I want to create an account
# So that I can view and signup for barre classes
#   [] Home page must have a sign up link
#   [] I must enter in all information to create an account
#   [] If I do not supply the required information, I receive an error

feature 'Sign Up' do
  scenario 'specifying valid and required information' do
    visit root_path
    click_link 'Sign Up'

    fill_in 'First Name', with: 'Heromine'
    fill_in 'Last Name', with: 'Granger'
    fill_in 'Username', with: 'leviOsa'
    fill_in 'Email', with: 'hg@hogwarts.com'
    fill_in 'Password', with: 'gryffindor'
    fill_in 'Confirm Password', with: 'gryffindor'
    click_button 'Sign Up'
    expect(page).to have_content("Welcome to Barre Better! You Have Successfully Signed Up.")
    expect(page).to have_content("Sign Out")
  end

  scenario 'required information is not supplied' do
    visit root_path
    click_link 'Sign Up'
    click_button 'Sign Up'

    expect(page).to have_content("Oops, Something Went Wrong.")
    expect(page).to have_content("Please Specify A First Name")
    expect(page).to have_content("Please Specify A Last Name")
    expect(page).to have_content("Please Specify A Username")
    expect(page).to have_content("Please Specify An Email")
    expect(page).to have_content("Please Specify A Password")
    expect(page).to_not have_content("Sign Out")
  end

  scenario 'password confirmation does not match' do
    visit root_path
    click_link 'Sign Up'

    fill_in 'First Name', with: 'Heromine'
    fill_in 'Last Name', with: 'Granger'
    fill_in 'Username', with: 'leviOsa'
    fill_in 'Email', with: 'hg@hogwarts.edu'
    fill_in 'Password', with: 'gryffindor'
    fill_in 'Confirm Password', with: 'hufflepuff'
    click_button 'Sign Up'

    expect(page).to have_content("Oops, Something Went Wrong.")
    expect(page).to have_content("Password Does Not Match")
    expect(page).to_not have_content("Sign Out")
  end

  scenario 'invalid email supplied' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Email', with: 'hg@gmailcom'
    click_button 'Sign Up'

    expect(page).to have_content("Oops, Something Went Wrong.")
    expect(page).to have_content("Please Specify A Valid Email.")
    expect(page).to_not have_content("Sign Out")
  end

  scenario 'password is too short' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Password', with: '777'
    click_button 'Sign Up'

    expect(page).to have_content("Oops, Something Went Wrong.")
    expect(page).to have_content("Password Is Too Short (6 Characters Minimum)")
    expect(page).to_not have_content("Sign Out")
  end
end
