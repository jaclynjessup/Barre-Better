require 'rails_helper'

feature "Admin can delete user" do
  scenario "admin deletes client" do
    admin = FactoryGirl.create(:user, role: "admin")
    client = FactoryGirl.create(:user, username: "luna")
    sign_in admin
    visit users_path
    expect(page).to have_content("luna")
    click_link("info-#{client.id}")
    click_button "Delete"
    expect(page).to_not have_content("luna")
  end

  scenario "admin deletes instructor" do
    admin = FactoryGirl.create(:user, role: "admin")
    instructor = FactoryGirl.create(:user, username: "mcgonagall")
    sign_in admin
    visit users_path
    expect(page).to have_content("mcgonagall")
    click_link("info-#{client.id}")
    click_button "Delete"
    expect(page).to_not have_content("mcgonagall")
  end
end
