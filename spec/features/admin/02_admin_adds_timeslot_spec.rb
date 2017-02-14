require 'rails_helper'

feature "Admin can edit timeslots" do
  scenario "admin adds timeslot" do
    admin = FactoryGirl.create(:user, role: "admin")
    sign_in admin
    visit instructors_path
    click_button "Add a Timeslot"
    fill_in 'Start Time', with: '5:15 PM'
    fill_in 'End Time', with: '6:15 PM'
    click_button 'Create Timeslot'
    expect(page).to have_content("Timeslot has been created")
    expect(page).to have_content("5:15 PM - 6:15 PM")
  end

  scenario "admin edits timeslot" do
    admin = FactoryGirl.create(:user, role: "admin")
    timeslot = FactoryGirl.create(:timeslot)
    sign_in admin
    visit instructors_path
    expect(page).to have_content timeslot.start_time
    visit edit_timeslot_path(timeslot)
    fill_in 'Start Time', with: '5:30 PM'
    fill_in 'End Time', with: '6:30 PM'
    click_button 'Create Timeslot'
    expect(page).to have_content("You've updated the Timeslot")
  end

  scenario "admin deletes timeslot" do
    admin = FactoryGirl.create(:user, role: "admin")
    timeslot = FactoryGirl.create(:timeslot)
    sign_in admin
    visit instructors_path
    expect(page).to have_content timeslot.start_time
    visit edit_timeslot_path(timeslot)
    click_button "Delete Timeslot"
    expect(page).to have_content("Timeslot Deleted")
  end
end
