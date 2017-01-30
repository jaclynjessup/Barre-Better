require 'rails_helper'

feature "Admin views user list" do
  scenario "Admin can see client and instructor list" do
    admin = FactoryGirl.create(:user, role: "admin")
    client = FactoryGirl.create(:user, role: "client")
    instructor = FactoryGirl.create(:user, role: "instructor")
    sign_in admin
    visit users_path

    expect(page).to have_content("All Clients of Barre Better")
    expect(page).to have_content("All Instructors of Barre Better")
  end

  scenario "Client cannot see user list" do
    client = FactoryGirl.create(:user, role: "client")
    sign_in client
    visit users_path
    expect(page).to have_content("I'm sorry you don't have access to the page.")
  end

  scenario "Instructor cannot see user list" do
    instructor = FactoryGirl.create(:user, role: "instructor")
    sign_in instructor
    visit users_path
    expect(page).to have_content("I'm sorry you don't have access to the page.")
  end
end
