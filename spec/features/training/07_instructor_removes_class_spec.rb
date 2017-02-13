require 'rails_helper'

# As an authenticated instructor
# I want to delete a class
# So that no client can sign up
#   [x] I must be signed in as an instructor
#   [x] I must visit the classes details page
#   [x] I must see a delete button

feature "Instructor wishes to delete a class" do
  scenario "instructor can view delete button" do
    training7 = FactoryGirl.create(:training)
    instructor = FactoryGirl.create(:user, role: "instructor")
    user = FactoryGirl.create(:user)
    userhistory = FactoryGirl.create(:user_history, user: user, training: training7)

    visit '/'
    sign_in instructor

    visit training_path(training7)

    expect(page).to have_content training7.barre_type.name
    expect(page).to have_content training7.instructor.full_name
    expect(page).to have_content training7.date.strftime("%B %d %Y")
    expect(page).to have_content training7.timeslot.start_time
    expect(page).to have_content training7.timeslot.end_time
    expect(page).to have_content user.first_name
    expect(page).to have_button "Delete Class"
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
    expect(page).to_not have_button "Delete Class"
  end
end
