require 'rails_helper'

# As a user
# I want to see an image about barre
# So that I can learn more
#   [x] Visit root path

feature 'Sign in to view History' do
  scenario 'a user sees barre image' do
    user = FactoryGirl.create(:user)
    training3 = FactoryGirl.create(:training, date: "2015-03-03")
    userhistory = FactoryGirl.create(:user_history, user: user, training: training3)
    visit '/'

    expect(page).to have_content("Welcome to Barre Better!")
    expect(page).to_not have_button "View Your Full History"
  end

  scenario 'an existing user does not see barre image' do
    user = FactoryGirl.create(:user)
    visit '/'
    click_link 'Sign In'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    expect(page).to_not have_content("Welcome to Barre Better!")
    expect(page).to have_button "View Your Full History"
  end
end
