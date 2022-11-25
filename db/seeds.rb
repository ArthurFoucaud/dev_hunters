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
dev_1 = Dev.new(name: "Romain Delimal", skill: "Ruby", price: 60, address:"Bibliothèque François Mitterand", user: user1)
dev_1.photo.attach(io: URI.open("https://avatars.githubusercontent.com/u/115033783?v=4"), filename: "avatar3.png", content_type: "image/png")
dev_1.save!
Dev.create(name: "Mathieu Trancoso", skill: "Full-stack", photo_url: "https://avatars.githubusercontent.com/u/54006203?v=4", price: 200, address:"68 Avenue Parmentier Paris", user: user1)
Dev.create(name: "Joël Irmiahu", skill: "Not-much", photo_url: "https://avatars.githubusercontent.com/u/115413668?v=4", price: 0.9, address:"Rue de la Jonction, 58300 Decize", user: user)
Dev.create(name: "Pierre Coppermann", skill: "Ruby, Python, JS, React", photo_url: "https://avatars.githubusercontent.com/u/96295313?v=4", price: 30, address:"68 Avenue Parmentier Paris", user: user)
Dev.create(name: "Nicolas Bischoff", skill: "Ruby, JS, React", photo_url: "https://avatars.githubusercontent.com/u/55391122?v=4", price: 100, address:"London
  United Kingdom", user: user)
Dev.create(name: "Timothée Régis", skill: "Ruby, JS, React", photo_url: "https://avatars.githubusercontent.com/u/59280703?v=4", price: 200, address:"16 Villa Godelet Paris", user: user1)
Dev.create(name: "Diane Johnston Roussillon", skill: "Html", photo_url: "https://avatars.githubusercontent.com/u/43373459?v=4", price: 5, address:"Ayakkuduk
  Uzbekistan", user: user1)
Dev.create(name: "Gautier David", skill: "React", photo_url: "https://avatars.githubusercontent.com/u/103845189?v=4", price: 75, address:"Xuctzul
  Guatemala", user: user)
Dev.create(name: "Thibaut Roland", skill: "CSS", photo_url: "https://avatars.githubusercontent.com/u/115095838?v=4", price: 20, address:"Dennebrœucq
  62560", user: user1)
Dev.create(name: "Gaspard Fauchille", skill: "C", photo_url: "https://avatars.githubusercontent.com/u/114876925?v=4", price: 60, address:"Roubaix
  59100", user: user)
Dev.create(name: "Emeline Barthe", skill: "solidity", photo_url: "https://avatars.githubusercontent.com/u/115411698?v=4", price: 70, address:"Sevran", user: user)
Dev.create(name: "Raphael Assaf(bg)", skill: "html", photo_url: "https://avatars.githubusercontent.com/u/115251007?v=4", price: 200, address:"Madrid", user: user)
Dev.create(name: "Aaron Delabays", skill: "solidity", photo_url: "https://avatars.githubusercontent.com/u/115422001?v=4", price: 150, address:"20 rue houdon Paris", user: user)
Dev.create(name: "Robin Rettien", skill: "Ruby, JS", photo_url: "https://avatars.githubusercontent.com/u/112618478?v=4", price: 2, address:"Rome", user: user)
Dev.create(name: "Pauline Gouttiere", skill: "HTML, CSS", photo_url: "https://avatars.githubusercontent.com/u/106176972?v=4", price: 52, address:"Lisbonne", user: user)
Dev.create(name: "Nicolaz Stacey", skill: "Ruby, JS", photo_url: "https://avatars.githubusercontent.com/u/74938003?v=4", price: 500, address:"Plymouth", user: user)
Dev.create(name: "Gabriel de Monts", skill: "CSS", photo_url: "https://avatars.githubusercontent.com/u/113995804?v=4", price: 6, address:"Barcelone", user: user)
puts "Seeds successfully seeded"
