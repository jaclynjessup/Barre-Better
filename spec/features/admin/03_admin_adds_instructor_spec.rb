require 'rails_helper'

feature "Admin can edit instructor" do
  scenario "admin adds timeslot" do
    admin = FactoryGirl.create(:user, role: "admin")
    sign_in admin
    visit instructors_path
    click_button "Add an Instructor"
    fill_in 'Full Name', with: 'Heromine Granger'
    fill_in 'Bio', with: 'Muggle born, best wizard and barre teacher around'
    click_button 'Create Instructor'
    expect(page).to have_content("Instructor has been created")
    expect(page).to have_content("Heromine Granger")
  end

  scenario "admin edits instructor" do
    admin = FactoryGirl.create(:user, role: "admin")
    instructor = FactoryGirl.create(:instructor)
    sign_in admin
    visit instructors_path
    expect(page).to have_content instructor.full_name
    visit edit_instructor_path(instructor)
    fill_in 'Full Name', with: 'Lily Potter'
    fill_in 'Bio', with: 'Mother of the boy who lived.'
    click_button 'Create Instructor'
    expect(page).to have_content("You've updated the Instructor")
  end

  scenario "admin deletes instructor" do
    admin = FactoryGirl.create(:user, role: "admin")
    instructor = FactoryGirl.create(:instructor)
    sign_in admin
    visit instructors_path
    expect(page).to have_content instructor.full_name
    visit edit_instructor_path(instructor)
    click_button "Delete Instructor"
    expect(page).to have_content("Instructor Deleted")
  end
end
