# frozen_string_literal: true

require 'open-uri'
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

file = URI.open('https://res.cloudinary.com/di0qqolg7/image/upload/v1686230253/99729852_je3j5m.jpg')
antonio = User.create(email: 'antonio@example.com', password: '123456', username: 'Antonio', age: 36,
                      bio: 'I proudly embrace my inner nerd as a passionate League of Legends player. The strategic depth, intense team battles, and ever-evolving meta of the game captivate me. I spend hours honing my skills, analyzing professional matches, and theorycrafting new champion builds. From epic comebacks to heart-pounding moments in ranked matches, League of Legends is my virtual battlefield where I unleash my competitive spirit and immerse myself in a vibrant community of fellow gamers. Eleganza!', address: 'Italy', admin: true)
antonio.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
antonio.save

file = URI.open('https://res.cloudinary.com/di0qqolg7/image/upload/v1686228858/128895388_b4wixu.jpg')
paul = User.create(email: 'paul@example.com', password: '123456', username: 'Paul', age: 31,
                   bio: 'I wear my nerd badge proudly as a devoted Warhammer fan. The intricately detailed miniatures, immersive lore, and strategic tabletop battles of the Warhammer universe have captured my heart. Spending countless hours painting and assembling armies, delving into the rich history of different factions, and strategizing complex battlefield maneuvers is where my passion truly shines. Whether participating in epic campaigns or engaging in friendly skirmishes, Warhammer is my gateway to a world of endless imagination and camaraderie among fellow hobbyists. Free muffins!', address: 'Ireland', admin: true)
paul.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
paul.save

file = URI.open('https://res.cloudinary.com/di0qqolg7/image/upload/v1686228958/130609951_xujihj.jpg')
baran = User.create(email: 'baran@example.com', password: '123456', username: 'Baran', age: 23,
                    bio: "my life revolves around all things Pokemon. From the classic Game Boy games to the latest releases, I've dedicated countless hours to training, battling, and collecting these beloved creatures. My knowledge of type matchups, shiny hunting techniques, and competitive strategies is extensive, and I'm always ready for a friendly Pokemon battle or a spirited discussion about team composition. Whether trading Pokemon with friends, participating in tournaments, or immersing myself in the vibrant Pokemon community, my obsession with these pocket monsters knows no bounds. Gym, gym, gym", address: 'Turkey', admin: true)
baran.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
baran.save

file = URI.open('https://res.cloudinary.com/di0qqolg7/image/upload/v1686228837/130290009_ichlgr.jpg')
charlotte = User.create(email: 'charlotte@example.com', password: '123456', username: 'dejanze', age: 18,
                        bio: "I proudly wear the label of a Dungeons and Dragons nerd. There's nothing quite like diving into fantastical realms, rolling dice, and embarking on epic quests with my trusty group of fellow adventurers. From creating intricate character backstories to immersing myself in the rich lore, D&D fuels my imagination and allows me to craft unforgettable stories. I'm always up for discussing the latest rulebooks, sharing campaign tales, and eagerly planning the next thrilling session. German baguette", address: 'Glasgow', admin: true)
charlotte.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
charlotte.save

file = URI.open('https://res.cloudinary.com/di0qqolg7/image/upload/v1686228924/130281789_vbzwup.jpg')
katharine = User.create(email: 'katharine@example.com', password: '123456', username: 'katzenjammer', age: 29,
                        bio: "A proud nerd who absolutely adores everything about Lord of the Rings. You'll often find me completely immersed in Tolkien's world, eagerly exploring the rich lore and engaging in passionate discussions with fellow fans. Whether I'm quoting Gandalf or dissecting the symbolic depth of the One Ring, my love for Middle-earth is contagious, and I'm always up for embarking on Tolkien-inspired adventures with like-minded enthusiasts. Texas forever", address: 'Boulder', admin: true)
katharine.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
katharine.save

file = URI.open('https://avatars.githubusercontent.com/u/90188399?v=4')
emma = User.create(email: 'emma@example.com', password: '123456', username: 'BEEEES', age: 21,
                   bio: 'Avid Northgard enthusiast and Viking conqueror. Guiding my clan through treacherous lands, I thrive on resource management, warfare, and strategic alliances. With a thirst for glory, I forge a legacy as a fearless leader in the harsh realm of Northgard. From colonization to mythological encounters, I navigate every challenge with cunning tactics and unwavering resolve. Join me on this epic Norse adventure, where legends are born and empires rise! ALSO I LOVE BEES 🐝', address: 'Sweden', admin: true)
emma.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
emma.save

file = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1601461074/xrbi2mzjyawsdisknhdd.jpg')
santi = User.create(email: 'santi@example.com', password: '123456', username: 'Sans-Chaise', age: 26,
                    bio: "Passionate strategist and avid Settlers of Catan enthusiast. With a keen eye for resource management, I conquer uncharted territories one roll at a time. When it comes to Catan, I am the embodiment of calculated moves and unwavering determination. Join me on this thrilling journey of expansion, trade, and victory. Together, we'll rewrite the rules of this legendary game. 🌾🏰", address: 'Berghain', admin: true)
santi.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
santi.save

file = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1592696437/u31nytay6nl7hofmwg6s.jpg')
pedro = User.create(email: 'pedro@example.com', password: '123456', username: 'Cabelo', age: 22,
                    bio: "Avid God of War enthusiast, wielding the Blades of Chaos with unmatched ferocity. As Kratos, I journey through realms, battling gods and monsters alike. With a deep understanding of Greek mythology, I embrace the game's visceral combat and unravel a captivating tale of vengeance and redemption. From epic boss fights to emotional storytelling, I am immersed in the intricacies of Kratos' journey. Join me as we delve into the realm of Norse mythology, where new adventures and untold battles await. 🦄", address: 'Playa', admin: true)
pedro.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
pedro.save

file = URI.open('https://avatars.githubusercontent.com/u/76880152?v=4')
nic = User.create(email: 'nic@example.com', password: '123456', username: 'Howdy', age: 24,
                  bio: "Dedicated World of Warcraft enthusiast, immersed in a realm of limitless adventure. From Azeroth's sprawling landscapes to epic raids and PvP battles, I traverse the depths of this virtual universe. As a skilled hero, I master multiple classes, harness powerful spells, and forge alliances with fellow players. Whether exploring ancient dungeons or engaging in thrilling quests, I am fueled by the passion for this ever-evolving world. Join me as we uncover secrets, vanquish foes, and leave an indelible mark on the Warcraft legacy.", address: 'Texas Baby!', admin: true)
nic.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
nic.save

file = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1664610806/zlimmirbsqffvhtljmd2.jpg')
laura = User.create(email: 'laura@example.com', password: '123456', username: 'Speedster', age: 19,
                    bio: "Passionate Mario Kart lover, speeding through colorful tracks with lightning reflexes. From classic races to intense battles, I dominate the karting world with well-timed power-ups and expert drifting skills. With a competitive spirit and a dash of nostalgia, I embrace the joy of multiplayer mayhem and exhilarating challenges. Join me on this high-octane adventure, where turtle shells fly, banana peels slip, and victory awaits at the finish line. Let's race, drift, and create unforgettable Mario Kart memories together! 🏎️ 💨", address: 'Berlin Berlin', admin: true)
laura.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
laura.save

puts 'Creating matches...'

match = Match.create(secondary_user_id: antonio.id)
match2 = Match.create(secondary_user_id: katharine.id)
match3 = Match.create(secondary_user_id: charlotte.id)
match4 = Match.create(secondary_user_id: baran.id)

puts 'Creating user_matches...'
user_match1 = UserMatch.new(user_id: paul.id, match_id: match.id, status: 'approved')
user_match1.save!

user_match2 = UserMatch.new(user_id: paul.id, match_id: match2.id, status: 'pending')
user_match2.save!

user_match3 = UserMatch.new(user_id: paul.id, match_id: match3.id, status: 'approved')
user_match3.save!
Chatroom.create(user_match: user_match3,
                name: user_match3.user == paul ? user_match3.match.secondary_user.username : user_match.user.username)

user_match4 = UserMatch.new(user_id: paul.id, match_id: match4.id, status: 'approved')
user_match4.save!
Chatroom.create(user_match: user_match4,
                name: user_match4.user == paul ? user_match4.match.secondary_user.username : user_match.user.username)

puts 'Creating chatroom...'
Chatroom.create(name: 'My chatroom', user_match_id: user_match1.id)

puts 'Creating games...'
game1 = Game.create(name: 'Chess')
game2 = Game.create(name: 'Clue')
game3 = Game.create(name: 'Dice')
game4 = Game.create(name: 'Poker')
game5 = Game.create(name: 'Hearts')
game6 = Game.create(name: 'klondike')
90.times do
  Game.create(name: Faker::Game.title)
end

puts 'Creating user_games...'
UserGame.create(user_id: antonio.id, game_id: game1.id)
UserGame.create(user_id: antonio.id, game_id: game2.id)
UserGame.create(user_id: antonio.id, game_id: game3.id)
UserGame.create(user_id: paul.id, game_id: game2.id)
UserGame.create(user_id: paul.id, game_id: game4.id)
UserGame.create(user_id: paul.id, game_id: game5.id)
UserGame.create(user_id: charlotte.id, game_id: game2.id)
UserGame.create(user_id: charlotte.id, game_id: game4.id)
UserGame.create(user_id: charlotte.id, game_id: game5.id)
UserGame.create(user_id: katharine.id, game_id: game2.id)

puts 'Creating appointments...'
appointment1 = Appointment.create(address: 'Le Wagon, Berlin', date: Date.today - 2, start_time: Time.now,
                                  end_time: Time.now, game_id: game1.id, user_match_id: user_match1.id, status: 'approved')
appointment2 = Appointment.create(address: "At Paul's, Berlin", date: Date.today, start_time: Time.now,
                                  end_time: Time.now, game_id: game2.id, user_match_id: user_match2.id, status: 'pending')
appointment3 = Appointment.create(address: 'Charlotte I Pizza, Berlin', date: Date.today, start_time: Time.now,
                                  end_time: Time.now, game_id: game1.id, user_match_id: user_match3.id, status: 'pending')
appointment4 = Appointment.create(address: 'La Gino, Berlin', date: Date.today, start_time: Time.now,
                                  end_time: Time.now, game_id: game2.id, user_match_id: user_match4.id, status: 'pending')

puts 'Creating reviews...'
Review.create(content: "It was the best gaming session ever, Paul loses like it's nobody's business", rating: 5,
              appointment_id: appointment1.id, user_id: antonio.id)
Review.create(content: 'Antonio won 10 times in a row, man is a legend', rating: 3, appointment_id: appointment1.id,
              user_id: paul.id)

# Delete all after testing:
Review.create(content: 'Paul freaks me out!', rating: 2, appointment_id: appointment1.id, user_id: antonio.id)
Review.create(content: 'Paul is mean to me', rating: 1, appointment_id: appointment1.id, user_id: antonio.id)
