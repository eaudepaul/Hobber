require "open-uri"
require 'faker'
require 'date'
puts 'Deleting reviews...'
Review.destroy_all

puts 'Deleting appointments...'
Appointment.destroy_all

puts 'Deleting user_games...'
UserGame.destroy_all

puts 'Deleting games...'
Game.destroy_all

puts 'Deleting messages...'
Message.destroy_all

puts 'Deleting chatrooms...'
Chatroom.destroy_all

puts 'Deleting user_matches...'
UserMatch.destroy_all

puts 'Deleting matches...'
Match.destroy_all

puts 'Deleting users...'
User.destroy_all

puts 'Creating users...'

file = URI.open("https://res.cloudinary.com/di0qqolg7/image/upload/v1686230253/99729852_je3j5m.jpg")
antonio = User.create(email: 'antonio@example.com', password: '123456', username: 'Antonio', age: 36, bio: 'Eleganza!', address: 'Italy', admin: true)
antonio.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
antonio.save

file = URI.open("https://res.cloudinary.com/di0qqolg7/image/upload/v1686228858/128895388_b4wixu.jpg")
paul = User.create(email: 'paul@example.com', password: '123456', username: 'Paul', age: 31, bio: 'Free muffins!', address: 'Ireland', admin: true)
paul.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
paul.save

file = URI.open("https://res.cloudinary.com/di0qqolg7/image/upload/v1686228958/130609951_xujihj.jpg")
baran = User.create(email: 'baran@example.com', password: '123456', username: 'Baran', age: 23, bio: 'Gym, gym, gym', address: 'Turkey', admin: true)
baran.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
baran.save

file = URI.open("https://res.cloudinary.com/di0qqolg7/image/upload/v1686228837/130290009_ichlgr.jpg")
charlotte = User.create(email: 'charlotte@example.com', password: '123456', username: 'dejanze', age: 18, bio: 'German baguette', address: 'Glasgow', admin: true)
charlotte.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
charlotte.save

file = URI.open("https://res.cloudinary.com/di0qqolg7/image/upload/v1686228837/130290009_ichlgr.jpg")
katharine = User.create(email: 'katharine@example.com', password: '123456', username: 'katzenjammer', age: 29, bio: 'Texas forever', address: 'Boulder', admin: true)
katharine.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
katharine.save


puts 'Creating matches...'
match_paul = Match.create(secondary_user_id: paul.id)
match_baran = Match.create(secondary_user_id: baran.id)
match_antonio = Match.create(secondary_user_id: antonio.id)

puts 'Creating user_matches...'
user_match_antonio_paul = UserMatch.create(user_id: antonio.id, match_id: match_paul.id, status: 'pending')
user_match_antonio_baran = UserMatch.create(user_id: antonio.id, match_id: match_baran.id, status: 'denied')
user_match_katharine_antonio = UserMatch.create(user_id: katharine.id, match_id: match_antonio.id, status: 'pending')
user_match_charlotte_antonio = UserMatch.create(user_id: charlotte.id, match_id: match_antonio.id, status: 'denied')

# puts 'Creating chatroom...'
# Chatroom.create(name: "My chatroom", user_match_id: user_match1.id)

puts 'Creating games...'
game1 = Game.create(name: 'Chess')
game2 = Game.create(name: 'Clue')
20.times do
  Game.create(name: Faker::Game.title)
end

puts 'Creating user_games...'
UserGame.create(user_id: antonio.id, game_id: game1.id)
UserGame.create(user_id: paul.id, game_id: game2.id)

# puts 'Creating appointments...'
# appointment1 = Appointment.create(address: 'Le Wagon, Berlin', date: Date.today, start_time: Time.now, end_time: Time.now, game_id: game1.id, user_match_id: user_match1.id)
# appointment2 = Appointment.create(address: "At Paul's, Berlin", date: Date.today, start_time: Time.now, end_time: Time.now, game_id: game2.id, user_match_id: user_match1.id)

# puts 'Creating reviews...'
# Review.create(content: "It was the best gaming session ever, Paul loses like it's nobody's business", rating: 10, appointment_id: appointment1.id, user_id: antonio.id)
# Review.create(content: "Antonio won 10 times in a row, man is a legend", rating: 8, appointment_id: appointment1.id, user_id: paul.id)
