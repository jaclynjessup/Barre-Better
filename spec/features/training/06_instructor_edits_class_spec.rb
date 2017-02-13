require 'rails_helper'

# As an authenticated instructor
# I  want to update a classes information
# So that I can correct errors or provide new information
#   [x] I must be signed in as an instructor
#   [x] I must visit the classes details page
#   [x] I must see an update button

feature "Instructor wishes to update a class" do
  scenario "instructor can view update button" do
    training = FactoryGirl.create(:training)
    instructor = FactoryGirl.create(:user, role: "instructor")
    user = FactoryGirl.create(:user)
    userhistory = FactoryGirl.create(:user_history, user: user, training: training)

    visit '/'
    sign_in instructor

    visit training_path(training)

    expect(page).to have_content training.barre_type.name
    expect(page).to have_content training.instructor.full_name
    expect(page).to have_content training.date.strftime("%B %d %Y")
    expect(page).to have_content training.timeslot.start_time
    expect(page).to have_content training.timeslot.end_time
    expect(page).to have_content user.first_name
    expect(page).to have_button "Update Class"
  end

  scenario "user cannot update a class" do
    training = FactoryGirl.create(:training)
    user = FactoryGirl.create(:user)
    visit '/'
    sign_in user

    visit training_path(training)

    expect(page).to have_content training.barre_type.name
    expect(page).to have_content training.instructor.full_name
    expect(page).to have_content training.date.strftime("%B %d %Y")
    expect(page).to have_content training.timeslot.start_time
    expect(page).to have_content training.timeslot.end_time
    expect(page).to_not have_button "Update Class"
  end
end
