require 'rails_helper'

# As an authenticated instructor
# I  want to update a classes information
# So that I can correct errors or provide new information
#   [] I must be signed in as an instructor
#   [] I must visit the classes details page
#   [] I must see an update button

feature "Instructor wishes to delete a class" do
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
    expect(page).to have_content user.first_name
  end
end
