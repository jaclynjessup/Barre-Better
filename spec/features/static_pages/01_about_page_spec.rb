require 'rails_helper'

# As an user
# I want to view the about page
# So that I can see what BarreBetter is
#   [x] View About Page

feature "User visits about page" do
  scenario "anyone can see about page" do
    visit '/'
    click_link 'About'

    expect(page).to have_content "Barre Better"
    expect(page).to have_content "github.com/jaclynjessup"
    expect(page).to have_content "Demo Client Account"
    expect(page).to have_content "Demo Instructor Account"
  end
end
