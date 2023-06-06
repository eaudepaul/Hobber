# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'date'
puts "Deleting appointments..."
Appointment.destroy_all

puts "Deleting games..."
Game.destroy_all

puts "Creating games..."
game1 = Game.create(name: "Chess")
game2 = Game.create(name: "Clue")

puts "Creating appointments..."

Appointment.create(address: "Le Wagon, Berlin", date: Date.today, start_time: Time.now, end_time: Time.now, game_id: game1.id)
Appointment.create(address: "At Paul's, Berlin", date: Date.today, start_time: Time.now, end_time: Time.now, game_id: game2.id)
