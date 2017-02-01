require 'rails_helper'

# As an authenticated user
# I want to sign up for a class
# So that I am enrolled in that class
#   [] I must be signed in as a client
#   [] I must see all classes
#   [] I must see a reserve button on a class that I am not signed up for

feature "client wants to reserve their spot at the barre" do
  pending scenario "client reserves their spot" do
    training = FactoryGirl.create(:training)
    user = FactoryGirl.create(:user)
    visit '/'
    sign_in user
    click_link 'Find a Class'

    click_link("show-#{training.id}")

    expect(page).to have_content training.name
    expect(page).to have_content training.instructor.full_name
    expect(page).to have_content training.date.strftime("%B %d %Y")
    expect(page).to have_content training.timeslot.start_time
    expect(page).to have_content training.timeslot.end_time
    expect(page).to have_content "Reserve"

    click_button "Reserve"

    expect(page).to have_content "You've successfully reserved your spot at the barre!"
  end
end
