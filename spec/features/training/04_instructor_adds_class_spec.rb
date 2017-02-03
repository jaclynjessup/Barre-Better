require 'rails_helper'

# As an authenticated instructor
# I want to add a class
# So that clients can sign up
#   [] I must be signed in as an instructor
#   [] I must see a button to add a new class

feature "Instructor can add a class" do
  let!(:barre_type) { BarreType.create(name: "Signature Barre", description: Faker::Hipster.paragraph(2)) }
  let!(:instructor) { Instructor.create(full_name: "Lily Potter", bio: Faker::Hipster.paragraph(2)) }
  let!(:timeslot) { Timeslot.create(start_time: '8:30', end_time: '9:30') }
  pending scenario "instructor can see add class button" do
    training = FactoryGirl.create(:training)
    instructor = FactoryGirl.create(:user, role: "instructor")
    visit '/'
    sign_in instructor
    click_link 'Find a Class'

    expect(page).to have_content training.barre_type.name

    click_button 'Add a Class'

    choose "Signature Barre"
    #find_field('timeslot').value
    #expect(page).to have_select('Timeslots', selected: '8:30 - 9:30')
    #select '8:30 - 9:30', from: "Timeslot"
    find_field('training[date]').value
    choose "Lily Potter"
    click_button "Create Class"
  end
end
