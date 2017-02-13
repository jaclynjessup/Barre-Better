require 'rails_helper'

# As an authenticated instructor
# I want to add a class
# So that clients can sign up
#   [x] I must be signed in as an instructor
#   [x] I must see a button to add a new class

feature "Instructor can add a class" do
  let!(:barre_type) { BarreType.create(name: "Signature Barre", description: Faker::Hipster.paragraph(2)) }
  let!(:instructor) { Instructor.create(full_name: "Lily Potter", bio: Faker::Hipster.paragraph(2)) }
  let!(:timeslot) { Timeslot.create(start_time: '8:30 AM', end_time: '9:30 AM') }
  scenario "instructor can see add class button" do
    training1 = FactoryGirl.create(:training)
    instructor = FactoryGirl.create(:user, role: "instructor")
    visit '/'
    sign_in instructor
    click_link 'Find a Class'

    expect(page).to have_content training1.barre_type.name

    click_button 'Add a Class'

    choose "Signature Barre"
    choose "8:30 AM"
    find_field('training[date]').value
    choose "Lily Potter"
    click_button "Create Class"
  end

  scenario "user cannot see add class button" do
    user = FactoryGirl.create(:user)
    visit '/'
    sign_in user
    click_link 'Find a Class'
    expect(page).to_not have_button 'Add a Class'
  end
end
