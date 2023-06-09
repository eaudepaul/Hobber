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
antonio = User.create(email: 'antonio@example.com', password: '123456', username: 'Antonio', age: 36, bio: "I proudly embrace my inner nerd as a passionate League of Legends player. The strategic depth, intense team battles, and ever-evolving meta of the game captivate me. I spend hours honing my skills, analyzing professional matches, and theorycrafting new champion builds. From epic comebacks to heart-pounding moments in ranked matches, League of Legends is my virtual battlefield where I unleash my competitive spirit and immerse myself in a vibrant community of fellow gamers. Eleganza!", address: 'Italy', admin: true)
antonio.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
antonio.save

file = URI.open("https://res.cloudinary.com/di0qqolg7/image/upload/v1686228858/128895388_b4wixu.jpg")
paul = User.create(email: 'paul@example.com', password: '123456', username: 'Paul', age: 31, bio: "I wear my nerd badge proudly as a devoted Warhammer fan. The intricately detailed miniatures, immersive lore, and strategic tabletop battles of the Warhammer universe have captured my heart. Spending countless hours painting and assembling armies, delving into the rich history of different factions, and strategizing complex battlefield maneuvers is where my passion truly shines. Whether participating in epic campaigns or engaging in friendly skirmishes, Warhammer is my gateway to a world of endless imagination and camaraderie among fellow hobbyists. Free muffins!", address: 'Ireland', admin: true)
paul.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
paul.save

file = URI.open("https://res.cloudinary.com/di0qqolg7/image/upload/v1686228958/130609951_xujihj.jpg")
baran = User.create(email: 'baran@example.com', password: '123456', username: 'Baran', age: 23, bio: "my life revolves around all things Pokemon. From the classic Game Boy games to the latest releases, I've dedicated countless hours to training, battling, and collecting these beloved creatures. My knowledge of type matchups, shiny hunting techniques, and competitive strategies is extensive, and I'm always ready for a friendly Pokemon battle or a spirited discussion about team composition. Whether trading Pokemon with friends, participating in tournaments, or immersing myself in the vibrant Pokemon community, my obsession with these pocket monsters knows no bounds. Gym, gym, gym", address: 'Turkey', admin: true)
baran.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
baran.save

file = URI.open("https://res.cloudinary.com/di0qqolg7/image/upload/v1686228837/130290009_ichlgr.jpg")
charlotte = User.create(email: 'charlotte@example.com', password: '123456', username: 'dejanze', age: 18, bio: "I proudly wear the label of a Dungeons and Dragons nerd. There's nothing quite like diving into fantastical realms, rolling dice, and embarking on epic quests with my trusty group of fellow adventurers. From creating intricate character backstories to immersing myself in the rich lore, D&D fuels my imagination and allows me to craft unforgettable stories. I'm always up for discussing the latest rulebooks, sharing campaign tales, and eagerly planning the next thrilling session. German baguette", address: 'Glasgow', admin: true)
charlotte.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
charlotte.save

file = URI.open("https://res.cloudinary.com/di0qqolg7/image/upload/v1686228837/130290009_ichlgr.jpg")
katharine = User.create(email: 'katharine@example.com', password: '123456', username: 'katzenjammer', age: 29, bio: "A proud nerd who absolutely adores everything about Lord of the Rings. You'll often find me completely immersed in Tolkien's world, eagerly exploring the rich lore and engaging in passionate discussions with fellow fans. Whether I'm quoting Gandalf or dissecting the symbolic depth of the One Ring, my love for Middle-earth is contagious, and I'm always up for embarking on Tolkien-inspired adventures with like-minded enthusiasts. Texas forever", address: 'Boulder', admin: true)
katharine.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
katharine.save

puts 'Creating matches...'
match = Match.create(secondary_user_id: paul.id)
match2 = Match.create(secondary_user_id: katharine.id)
match3 = Match.create(secondary_user_id: charlotte.id)
match4 = Match.create(secondary_user_id: baran.id)

puts 'Creating user_matches...'
user_match1 = UserMatch.new(user_id: antonio.id, match_id: match.id, status: 'pending')
user_match1.save!

user_match2 = UserMatch.new(user_id: paul.id, match_id: match2.id, status: 'pending')
user_match2.save!

user_match3 = UserMatch.new(user_id: paul.id, match_id: match3.id, status: 'pending')
user_match3.save!

user_match4 = UserMatch.new(user_id: paul.id, match_id: match4.id, status: 'pending')
user_match4.save!

puts 'Creating chatroom...'
Chatroom.create(name: "My chatroom", user_match_id: user_match1.id)

puts 'Creating games...'
game1 = Game.create(name: 'Chess')
game2 = Game.create(name: 'Clue')
20.times do
  Game.create(name: Faker::Game.title)
end

puts 'Creating user_games...'
UserGame.create(user_id: antonio.id, game_id: game1.id)
UserGame.create(user_id: paul.id, game_id: game2.id)

puts 'Creating appointments...'
appointment1 = Appointment.create(address: 'Le Wagon, Berlin', date: Date.today, start_time: Time.now, end_time: Time.now, game_id: game1.id, user_match_id: user_match1.id)
appointment2 = Appointment.create(address: "At Paul's, Berlin", date: Date.today, start_time: Time.now, end_time: Time.now, game_id: game2.id, user_match_id: user_match1.id)

# puts 'Creating reviews...'
# Review.create(content: "It was the best gaming session ever, Paul loses like it's nobody's business", rating: 10, appointment_id: appointment1.id, user_id: antonio.id)
# Review.create(content: "Antonio won 10 times in a row, man is a legend", rating: 8, appointment_id: appointment1.id, user_id: paul.id)
