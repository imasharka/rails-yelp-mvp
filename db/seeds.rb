# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Restaurant.destroy_all
Review.destroy_all

5.times do
  r = Restaurant.create!(name: Faker::Restaurant.name,
                         address: Faker::Address.street_address,
                         phone_number: Faker::PhoneNumber.phone_number,
                         category: %w(chinese italian japanese french belgian).sample)
  puts "Created #{r.name}"
  Review.create!(content: Faker::TvShows::GameOfThrones.quote,
                 rating: rand(1..5),
                 restaurant_id: Restaurant.all.sample.id)
end

puts "Created #{Restaurant.count} restaurant"
