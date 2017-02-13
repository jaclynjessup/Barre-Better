require 'rails_helper'

# As an authenticated instructor
# I want to view the details about a class
# So that I can see how many clients have signed up
#   [x] I must be signed in as an instructor
#   [x] I must see the class details
#   [x] I must see the attendance of the class

feature "Instructor wishes to see who enrolled in class" do
  scenario "instructor can view attendance" do
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
    expect(page).to have_content "Attendance"
    expect(page).to have_content user.first_name
  end

  scenario "a user cannot view attendance" do
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
    expect(page).to_not have_content "Attendance"
  end
end
