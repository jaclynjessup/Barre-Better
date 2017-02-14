require 'rails_helper'

feature "Admin can edit barre types" do
  scenario "admin adds barre type" do
    admin = FactoryGirl.create(:user, role: "admin")
    sign_in admin
    visit instructors_path
    click_button "Add a Barre Type"
    fill_in 'Name', with: 'Platform'
    fill_in 'Description', with: 'Get ready to fly at the barre.'
    click_button 'Create Barre Type'
    expect(page).to have_content("You've updated the Barre Types")
    expect(page).to have_content("Platform")
  end

  scenario "admin edits barre type" do
    admin = FactoryGirl.create(:user, role: "admin")
    barretype = FactoryGirl.create(:barre_type)
    sign_in admin
    visit instructors_path
    expect(page).to have_content barretype.name
    visit edit_barre_type_path(barretype)
    fill_in 'Name', with: 'Platform'
    fill_in 'Description', with: 'Get ready to fly at the barre.'
    click_button 'Create Barre Type'
    expect(page).to have_content("You've updated the Barre Types")
  end

  scenario "admin deletes barre type" do
    admin = FactoryGirl.create(:user, role: "admin")
    barretype = FactoryGirl.create(:barre_type)
    sign_in admin
    visit instructors_path
    expect(page).to have_content barretype.name
    visit edit_barre_type_path(barretype)
    click_button "Delete Barre Type"
    expect(page).to have_content("Barre Type Deleted")
  end
end
