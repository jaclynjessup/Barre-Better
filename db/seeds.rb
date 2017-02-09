# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Timeslot.create([{start_time: '5:30 AM', end_time: '6:30 AM'},
                {start_time: '7:00 AM', end_time: '8:00 AM'},
                {start_time: '8:15 AM', end_time: '9:15 AM'},
                {start_time: '9:30 AM', end_time: '10:30 AM'},
                {start_time: '12:00 PM', end_time: '1:00 PM'},
                {start_time: '4:15 PM', end_time: '5:15 PM'},
                {start_time: '5:30 PM', end_time: '6:30 PM'},
                {start_time: '7:00 PM', end_time: '8:00 PM'},
                {start_time: '8:20 AM', end_time: '9:20 AM'},
                {start_time: '9:40 AM', end_time: '10:40 AM'},
                {start_time: '11:00 AM', end_time: '12:00 PM'}
              ])

BarreType.create([{ name: 'Signature Barre', description: "Our signature class appeals to those who practice various exercise disciplines including Pilates, yoga, and even classical ballet. Set to carefully curated music, we choreograph each of our Signature classes to include everything you love about barre." },
                  { name: 'Sculpt Barre', description: "Sculpt focuses on slow, impactful, deliberate movement designed to build strength and tone using only your body weight for resistance. The combinations, structure, and pace challenge you to go deeper into each exercise like never before" },
                  { name: 'Stretch Barre', description: "Stretch consits of flowing movement which focuses on flexibility, balance, and core strength. The class progresses one movement at a time eventually building into a choreographic sequence repeated multiple times to varying tempos allowing you to enter into a state of active meditation" },
                  { name: 'Strength Barre', description: "Strength focuses on mixing signature and sculpt classes to leave you feeling even stronger. The combinations of deliberate movement designed to build strength and tone along with dance conditioning, strength training, balance work, and cardio." }
  ])

10.times { Instructor.create({
          full_name: Faker::HarryPotter.character,
          bio: Faker::HarryPotter.quote
  }) }
#
Timeslot.all.each do |time|
  names = BarreType.all
  instructors = Instructor.all
  Training.create({
    barre_type: names.sample,
    date: Faker::Date.between_except(1.year.ago, 1.year.from_now, Date.today),
    timeslot: time,
    instructor: instructors.sample
    })
end

User.create(first_name: "Client", last_name: "Test", email: "client@barrebetter.com", password: "barre1",
    username: "client1", role: "client")

User.create(first_name: "Instructor", last_name: "Test", email: "instructor@barrebetter.com", password: "barre1",
    username: "instructor1", role: "instructor")

    User.create(first_name: "Admin", last_name: "Test", email: "admin@barrebetter.com", password: "barre1",
        username: "admin1", role: "admin")
