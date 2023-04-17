# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
5.times do
  first_name = Faker::Name.name
  last_name = Faker::Name.last_name
  gender = Faker::Gender.type
  birthday = Faker::Date.between(from: '1965-09-23', to: '2014-09-25')

  Author.create first_name:, last_name:, gender:, birthday:
end