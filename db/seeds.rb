
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
