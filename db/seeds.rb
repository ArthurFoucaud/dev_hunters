# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Dropping Database"
Dev.destroy_all
puts "Seedings pokemons"
user = User.create(email:"default@default.com",password: "123456")
Dev.create!(name: "Romain Delimal", skill: "Ruby", photo_url: "https://avatars.githubusercontent.com/u/115033783?v=4", user: user)
Dev.create(name: "Mathieu Trancoso", skill: "Full-stack", photo_url: "https://avatars.githubusercontent.com/u/54006203?v=4", user: user)
Dev.create(name: "Joël Irmiahu", skill: "Not-much", photo_url: "https://avatars.githubusercontent.com/u/115413668?v=4", user: user)
Dev.create(name: "Pierre Coppermann", skill: "Ruby, Python, JS, React", photo_url: "https://avatars.githubusercontent.com/u/96295313?v=4", user: user)
Dev.create(name: "Nicolas Bischoff", skill: "Ruby, JS, React", photo_url: "https://avatars.githubusercontent.com/u/55391122?v=4", user: user)
puts "Seeds successfully seeded"
