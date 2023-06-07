# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:

require 'date'
puts 'Deleting appointments...'
Appointment.destroy_all

puts 'Deleting games...'
Game.destroy_all

puts 'Deleting user_matches...'
UserMatch.destroy_all

puts 'Deleting users...'
User.destroy_all

puts 'Creating users...'
antonio = User.create(email: 'antonio@example.com', password: '123456', name: 'Antonio', username: 'Antonio', age: 36, bio: 'Eleganza!', address: 'Italy')
paul = User.create(email: 'paul@example.com', password: '123456', name: 'Paul', username: 'Paul', age: 31, bio: 'Free muffins!', address: 'Ireland')

puts 'Creating matches...'
match = Match.create(secondary_user_id: paul.id)

puts 'Creating user_matches...'
user_match1 = UserMatch.new(user_id: antonio.id, match_id: match.id, status: 'pending')
user_match1.save!

puts 'Creating games...'
game1 = Game.create(name: 'Chess')
game2 = Game.create(name: 'Clue')

puts 'Creating appointments...'

Appointment.create(address: 'Le Wagon, Berlin', date: Date.today, start_time: Time.now, end_time: Time.now, game_id: game1.id, user_match_id: user_match1.id)
Appointment.create(address: "At Paul's, Berlin", date: Date.today, start_time: Time.now, end_time: Time.now, game_id: game2.id, user_match_id: user_match1.id)
