# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do
  user = User.create(
      name: Faker::TvShows::StrangerThings.character,
      email: Faker::Internet.email
  )
  3.times do
    trip = Trip.create(
      name: Faker::Nation.capital_city,
      start_date: Faker::Date.in_date_period(year: 2020, month: 2),
      end_date: Faker::Date.in_date_period(year: 2020, month: 3),
      participants: Faker::Number.number(digits: 1),
      budget: Faker::Number.number(digits: 4),
      user_id: user.id
    )
      Location.create(
        name: Faker::TvShows::GameOfThrones.city,
        description: Faker::TvShows::GameOfThrones.quote,
        trip_id: trip.id
      )
      # Address.create(
      #   city: Faker::Address.city,
      #   state: Faker::Address.state,
      #   zip: Faker::Address.zip,
      #   location_id: location.id
      # )
end
end
puts "data has been seeded"

