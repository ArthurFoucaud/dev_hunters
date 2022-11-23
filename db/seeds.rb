# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

puts "Dropping Database"
Booking.destroy_all
Dev.destroy_all
User.destroy_all
puts "Seedings slaves"
user = User.create!(email:"default@default.com",password: "123456")
user1 = User.create!(email:"arthur@default.com",password: "123456")
dev_1 = Dev.new(name: "Romain Delimal", skill: "Ruby", price: 100, adress:"Bibliothèque François Mitterand", user: user1)
dev_1.photo.attach(io: URI.open("https://avatars.githubusercontent.com/u/115033783?v=4"), filename: "avatar.png", content_type: "image/png")
dev_1.save!
Dev.create(name: "Mathieu Trancoso", skill: "Full-stack", photo_url: "https://avatars.githubusercontent.com/u/54006203?v=4", price: 200, adress:"68 Avenue Parmentier Paris", user: user1)
Dev.create(name: "Joël Irmiahu", skill: "Not-much", photo_url: "https://avatars.githubusercontent.com/u/115413668?v=4", price: 0.9, adress:"Rue de la Jonction, 58300 Decize", user: user)
Dev.create(name: "Pierre Coppermann", skill: "Ruby, Python, JS, React", photo_url: "https://avatars.githubusercontent.com/u/96295313?v=4", price: 100, adress:"68 Avenue Parmentier Paris", user: user)
Dev.create(name: "Nicolas Bischoff", skill: "Ruby, JS, React", photo_url: "https://avatars.githubusercontent.com/u/55391122?v=4", price: 100, adress:"London
  United Kingdom", user: user)
Dev.create(name: "Timothée Régis", skill: "Ruby, JS, React", photo_url: "https://avatars.githubusercontent.com/u/59280703?v=4", price: 100, adress:"16 Villa Godelet Paris", user: user1)
Dev.create(name: "Diane Johnston Roussillon", skill: "Html", photo_url: "https://avatars.githubusercontent.com/u/43373459?v=4", price: 100, adress:"Ayakkuduk
  Uzbekistan", user: user1)
Dev.create(name: "Gautier David", skill: "React", photo_url: "https://avatars.githubusercontent.com/u/103845189?v=4", price: 100, adress:"Xuctzul
  Guatemala", user: user)
Dev.create(name: "Thibaut Roland", skill: "CSS", photo_url: "https://avatars.githubusercontent.com/u/115095838?v=4", price: 100, adress:"Dennebrœucq
  62560", user: user1)
Dev.create(name: "Gaspard Fauchille", skill: "C", photo_url: "https://avatars.githubusercontent.com/u/114876925?v=4", price: 100, adress:"Roubaix
  59100", user: user)
puts "Seeds successfully seeded"
