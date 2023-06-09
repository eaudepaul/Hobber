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

# Core users
file = URI.open('https://res.cloudinary.com/di0qqolg7/image/upload/v1686230253/99729852_je3j5m.jpg')
antonio = User.create(email: 'antonio@example.com', password: '123456', username: 'Antonio', age: 36,
                      bio: 'I proudly embrace my inner nerd as a passionate League of Legends player. The intense team battles captivate me. Eleganza!', address: 'Italy', admin: true)
antonio.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
antonio.save

file = URI.open('https://res.cloudinary.com/di0qqolg7/image/upload/v1686228858/128895388_b4wixu.jpg')
paul = User.create(email: 'paul@example.com', password: '123456', username: 'Paul', age: 31,
                   bio: 'I wear my nerd badge proudly as a devoted Warhammer fan. I spend countless hours painting and assembling miniature armies. Also, free muffins!', address: 'Ireland', admin: true)
paul.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
paul.save

file = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1683901315/soxbao44wpjyz8hlfwvb.jpg')
baran = User.create(email: 'baran@example.com', password: '123456', username: 'Baran', age: 23,
                    bio: "My life revolves around all things Pokemon and gym, gym, gym! I can also advise you on your finances.", address: 'Turkey', admin: true)
baran.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
baran.save

file = URI.open('https://res.cloudinary.com/di0qqolg7/image/upload/v1686228837/130290009_ichlgr.jpg')
charlotte = User.create(email: 'charlotte@example.com', password: '123456', username: 'dejanze', age: 18,
                        bio: "I'm a German baguette obsessed with Settlers of Catan. I am passionate about outwitting my opponents and becoming ruler of the island.", address: 'Glasgow', admin: true)
charlotte.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
charlotte.save

file = URI.open('https://res.cloudinary.com/di0qqolg7/image/upload/v1686228924/130281789_vbzwup.jpg')
katharine = User.create(email: 'katharine@example.com', password: '123456', username: 'katzenjammer', age: 29,
                        bio: "A proud nerd who absolutely adores everything about Lord of the Rings. Always up for embarking on Tolkien-inspired adventures. Texas forever", address: 'Boulder', admin: true)
katharine.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
katharine.save

file = URI.open('https://avatars.githubusercontent.com/u/90188399?v=4')
emma = User.create(email: 'emma@example.com', password: '123456', username: 'BEEEES', age: 21,
                   bio: "Avid Northgard enthusiast. Join me on an epic Norse adventure, where legends are born and empires rise! ALSO I LOVE BEES 🐝", address: 'Sweden', admin: false)
emma.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
emma.save

# Other users
file = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1601461074/xrbi2mzjyawsdisknhdd.jpg')
santi = User.create(email: 'santi@example.com', password: '123456', username: 'Sans-Chaise', age: 26,
                    bio: "Passionate SQL strategist and avid Settlers of Catan enthusiast. Together, we'll rewrite the rules of this legendary game. 🌾🏰", address: 'Berghain', admin: false)
santi.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
santi.save

file = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1592696437/u31nytay6nl7hofmwg6s.jpg')
pedro = User.create(email: 'pedro@example.com', password: '123456', username: 'Cabelo', age: 22,
                    bio: "Avid God of War enthusiast, wielding the Blades of Chaos with unmatched ferocity. 🦄", address: 'Playa', admin: false)
pedro.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
pedro.save

file = URI.open('https://ca.slack-edge.com/T02NE0241-U9KFW7V7V-e59494421ade-512')
zak = User.create(email: 'zak@example.com', password: '123456', username: 'Zakaryaaa', age: 20,
                    bio: "Captivating audiences with my mesmerizing performances, I am a magician who loves to bring wonder and astonishment to those around me.🪄♣️♥️♠️♦️🃏", address: 'Playa', admin: false)
zak.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
zak.save

file = URI.open('https://avatars.githubusercontent.com/u/76880152?v=4')
nic = User.create(email: 'nic@example.com', password: '123456', username: 'Howdy', age: 24,
                  bio: "Dedicated World of Warcraft enthusiast. I traverse the depths of this virtual universe as a skilled hero. TEXASSSSSSS", address: 'Texas Baby!', admin: false)
nic.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
nic.save

file = URI.open('https://ca.slack-edge.com/T02NE0241-U045BSBJQD6-f9f50ddff2bb-512')
josh = User.create(email: 'josh@example.com', password: '123456', username: 'The best or worst TA depending on how you see it', age: 23,
                  bio: "I'm deeply immersed in the gripping world of The Last of Us. ZOMBIES!!!! 🧟‍♀️🧟‍♂️", address: 'Le Wagon', admin: false)
josh.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
josh.save

file = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1664610806/zlimmirbsqffvhtljmd2.jpg')
laura = User.create(email: 'laura@example.com', password: '123456', username: 'Speedster', age: 19,
                    bio: "Passionate Mario Kart lover, speeding through colorful tracks with lightning reflexes. 🏎️ 💨", address: 'Berlin Berlin', admin: false)
laura.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
laura.save

file = URI.open('https://avatars.githubusercontent.com/u/129849001?v=4')
pamela = User.create(email: 'pamela@example.com', password: '123456', username: 'Pamela123', age: 30,
                     bio: "As a master of virtual realms, I conquer galaxies in Mass Effect and slay demons in Devil May Cry. 🎀🌌🪐", address: 'Strawberry fields', admin: false)
pamela.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
pamela.save

file = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1680906057/wvpvxivbjzsslr1zudf4.jpg')
bruno = User.create(email: 'bruno@example.com', password: '123456', username: 'Brunooooo', age: 25,
                    bio: "Armed with a controller, I embark on epic quests in The Elder Scrolls 📜.", address: 'Grunewald', admin: false)
bruno.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
bruno.save

file = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1680798077/xvkfom6njqle804vkteg.jpg')
rama = User.create(email: 'rama@example.com', password: '123456', username: 'RamaXtreme', age: 22,
                    bio: "In the world of Magic: The Gathering, 🧙🏻‍♂️ I summon spells, craft intricate strategies, and rise as a formidable mage.🪄", address: 'Italia', admin: false)
rama.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
rama.save

file = URI.open('https://avatars.githubusercontent.com/u/23138486?v=4')
william = User.create(email: 'william@example.com', password: '123456', username: 'Will-I-Am', age: 25,
                    bio: "With a Dungeon Master's guide in hand, ✋🏼 I shape worlds and lead adventurers through perilous quests in Dungeons & Dragons. 🐉", address: 'Berlin', admin: false)
william.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
william.save

file = URI.open('https://avatars.githubusercontent.com/u/130440951?v=4')
ahmed = User.create(email: 'ahmed@example.com', password: '123456', username: 'ahmedforever', age: 30,
                    bio: "I dance across pixelated platforms, smashing blocks 🧊 in Mario and collecting rings with Sonic. 🦔", address: 'U6', admin: false)
ahmed.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
ahmed.save

file = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1681067327/rlbeeocqksy18qyvfojn.jpg')
madhava = User.create(email: 'madhava@example.com', password: '123456', username: 'Madhava5000', age: 900,
                    bio: "Master tactician in XCOM. I lead squads against extraterrestrial threats, 👾🛸 ensuring humanity's survival.", address: "Rama's house", admin: false)
madhava.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
madhava.save

file = URI.open('https://avatars.githubusercontent.com/u/123891185?v=4')
dabin = User.create(email: 'dabin@example.com', password: '123456', username: 'Dabs', age: 33,
                    bio: "Armed with a paintbrush, 🖌️🎨 I bring miniatures to life, meticulously crafting armies for Warhammer battles. ⚔️", address: 'Mehringdamm', admin: false)
dabin.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
dabin.save

file = URI.open('https://avatars.githubusercontent.com/u/59374075?v=4')
esther = User.create(email: 'esther@example.com', password: '123456', username: 'EstherAmazing', age: 27,
                    bio: "seasoned archaeologist 🦴 in Tomb Raider, I uncover ancient secrets with Lara Croft.", address: 'Kochstraße', admin: false)
esther.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
esther.save

file = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1681132323/fvcczs8pnj8mkthgl5ec.jpg')
esti = User.create(email: 'esti@example.com', password: '123456', username: 'Esti_64', age: 27,
                    bio: "As a cunning detective in Sherlock Holmes: Consulting Detective, I solve complex mysteries🕵🏻🔎", address: 'Berlino', admin: false)
esti.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
esti.save

file = URI.open('https://avatars.githubusercontent.com/u/130139542?v=4')
agustin = User.create(email: 'agustin@example.com', password: '123456', username: 'Ultra_Agustin', age: 33,
                    bio: "Armed with a guitar, I rock out in Guitar Hero,🎸 shredding solos and captivating audiences with my musical prowess.🎮", address: 'Nature', admin: false)
agustin.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
agustin.save

file = URI.open('https://avatars.githubusercontent.com/u/128507964?v=4')
ana = User.create(email: 'ana@example.com', password: '123456', username: 'Ana loves puppies', age: 25,
                    bio: "In the realm of Animal Crossing, I create a cozy virtual village, tend to adorable animal neighbors 🐻🐶🐷🦊", address: 'Portugal', admin: false)
ana.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
ana.save

file = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1683808035/fbwkedfhwnpdhex6ey3f.jpg')
marina = User.create(email: 'marina@example.com', password: '123456', username: 'GamerGirl666', age: 26,
                    bio: "As a top-ranked sniper in Call of Duty, I dominate the battlefield with sharpshooter precision.🤘🏻", address: 'Moldova', admin: false)
marina.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
marina.save

file = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1681054612/uxpiwevsnyrifzg8h2tj.jpg')
joanna = User.create(email: 'joanna@example.com', password: '123456', username: 'JoannaJoyful', age: 35,
                    bio: "In the realm of Assassin's Creed, I become a master assassin. 🥷🏻", address: 'Pottery studio', admin: false)
joanna.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
joanna.save

file = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1681060939/vlrjqpbj7jccvv2x3us8.jpg')
emily = User.create(email: 'emily@example.com', password: '123456', username: 'Little Yetsko', age: 35,
                    bio: "With a stack of board games by my side, I transform into a strategic genius. 💡", address: 'NYC forever', admin: false)
emily.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
emily.save

puts 'Creating matches...'

match = Match.create(secondary_user_id: antonio.id)
match1 = Match.create(secondary_user_id: paul.id)
match2 = Match.create(secondary_user_id: katharine.id)
match3 = Match.create(secondary_user_id: charlotte.id)
match4 = Match.create(secondary_user_id: baran.id)
match5 = Match.create(secondary_user_id: emma.id)

puts 'Creating user_matches and chatrooms...'

# Paul x Antonio
user_match1 = UserMatch.new(user_id: antonio.id, match_id: match1.id, status: 'approved')
user_match1.save!
Chatroom.create(user_match: user_match1,
                name: user_match1.user == antonio ? user_match1.match.secondary_user.username : user_match1.user.username)

# Paul x Katharine
user_match2 = UserMatch.new(user_id: katharine.id, match_id: match1.id, status: 'approved')
user_match2.save!
Chatroom.create(user_match: user_match2,
                name: user_match2.user == katharine ? user_match2.match.secondary_user.username : user_match2.user.username)

# Paul x Emma
user_match3 = UserMatch.new(user_id: emma.id, match_id: match1.id, status: 'approved')
user_match3.save!
Chatroom.create(user_match: user_match3,
                name: user_match3.user == emma ? user_match3.match.secondary_user.username : user_match3.user.username)

# Paul x Santi
user_match7 = UserMatch.new(user_id: santi.id, match_id: match1.id, status: 'pending')
user_match7.save!
Chatroom.create(user_match: user_match7,
                name: user_match7.user == santi ? user_match7.match.secondary_user.username : user_match7.user.username)

# Paul x Baran
user_match4 = UserMatch.new(user_id: baran.id, match_id: match1.id, status: 'pending')
user_match4.save!
Chatroom.create(user_match: user_match4,
                name: user_match4.user == baran ? user_match4.match.secondary_user.username : user_match4.user.username)

# Paul x Charlotte
user_match5 = UserMatch.new(user_id: charlotte.id, match_id: match1.id, status: 'approved')
user_match5.save!
Chatroom.create(user_match: user_match5,
                name: user_match5.user == charlotte ? user_match5.match.secondary_user.username : user_match5.user.username)

# Antonio's matches
user_match6 = UserMatch.new(user_id: antonio.id, match_id: match2.id, status: 'approved')
user_match6.save!
Chatroom.create(user_match: user_match6,
                name: user_match6.user == antonio ? user_match6.match.secondary_user.username : user_match6.user.username)

puts 'Creating games...'
game1 = Game.create(name: 'Warhammer AOS')
game2 = Game.create(name: 'Settlers of Catan')
game3 = Game.create(name: 'Dungeons & Dragons')
game4 = Game.create(name: 'Warhammer 40K')
game5 = Game.create(name: 'Middle Earth SBG')
90.times do
  Game.create(name: Faker::Game.title)
end

puts 'Creating user_games...'
UserGame.create(user_id: antonio.id, game_id: game1.id)
UserGame.create(user_id: antonio.id, game_id: game2.id)
UserGame.create(user_id: antonio.id, game_id: game3.id)
UserGame.create(user_id: paul.id, game_id: game1.id)
UserGame.create(user_id: paul.id, game_id: game2.id)
UserGame.create(user_id: paul.id, game_id: game3.id)
UserGame.create(user_id: paul.id, game_id: game4.id)
UserGame.create(user_id: paul.id, game_id: game5.id)
UserGame.create(user_id: charlotte.id, game_id: game2.id)
UserGame.create(user_id: charlotte.id, game_id: game4.id)
UserGame.create(user_id: charlotte.id, game_id: game5.id)
UserGame.create(user_id: katharine.id, game_id: game2.id)
UserGame.create(user_id: katharine.id, game_id: game3.id)
UserGame.create(user_id: katharine.id, game_id: game5.id)
UserGame.create(user_id: baran.id, game_id: game1.id)
UserGame.create(user_id: baran.id, game_id: game2.id)
UserGame.create(user_id: baran.id, game_id: game3.id)
UserGame.create(user_id: emma.id, game_id: game1.id)
UserGame.create(user_id: emma.id, game_id: game2.id)
UserGame.create(user_id: emma.id, game_id: game5.id)
UserGame.create(user_id: ahmed.id, game_id: game1.id)
UserGame.create(user_id: ahmed.id, game_id: game2.id)
UserGame.create(user_id: ahmed.id, game_id: game3.id)
UserGame.create(user_id: william.id, game_id: game1.id)
UserGame.create(user_id: william.id, game_id: game2.id)
UserGame.create(user_id: rama.id, game_id: game2.id)
UserGame.create(user_id: rama.id, game_id: game4.id)
UserGame.create(user_id: rama.id, game_id: game5.id)
UserGame.create(user_id: bruno.id, game_id: game2.id)
UserGame.create(user_id: bruno.id, game_id: game3.id)
UserGame.create(user_id: bruno.id, game_id: game5.id)
UserGame.create(user_id: laura.id, game_id: game1.id)
UserGame.create(user_id: laura.id, game_id: game2.id)
UserGame.create(user_id: laura.id, game_id: game3.id)
UserGame.create(user_id: josh.id, game_id: game1.id)
UserGame.create(user_id: josh.id, game_id: game2.id)
UserGame.create(user_id: josh.id, game_id: game5.id)
UserGame.create(user_id: zak.id, game_id: game1.id)
UserGame.create(user_id: zak.id, game_id: game2.id)
UserGame.create(user_id: zak.id, game_id: game3.id)
UserGame.create(user_id: pedro.id, game_id: game2.id)
UserGame.create(user_id: pedro.id, game_id: game4.id)
UserGame.create(user_id: pedro.id, game_id: game5.id)
UserGame.create(user_id: santi.id, game_id: game2.id)
UserGame.create(user_id: santi.id, game_id: game3.id)
UserGame.create(user_id: santi.id, game_id: game5.id)
UserGame.create(user_id: nic.id, game_id: game1.id)
UserGame.create(user_id: nic.id, game_id: game2.id)
UserGame.create(user_id: nic.id, game_id: game3.id)
UserGame.create(user_id: pamela.id, game_id: game1.id)
UserGame.create(user_id: pamela.id, game_id: game2.id)
UserGame.create(user_id: pamela.id, game_id: game5.id)
UserGame.create(user_id: madhava.id, game_id: game1.id)
UserGame.create(user_id: madhava.id, game_id: game2.id)
UserGame.create(user_id: madhava.id, game_id: game5.id)
UserGame.create(user_id: dabin.id, game_id: game2.id)
UserGame.create(user_id: dabin.id, game_id: game3.id)
UserGame.create(user_id: dabin.id, game_id: game5.id)
UserGame.create(user_id: esther.id, game_id: game1.id)
UserGame.create(user_id: esther.id, game_id: game2.id)
UserGame.create(user_id: esther.id, game_id: game3.id)
UserGame.create(user_id: esti.id, game_id: game1.id)
UserGame.create(user_id: esti.id, game_id: game2.id)
UserGame.create(user_id: esti.id, game_id: game5.id)
UserGame.create(user_id: agustin.id, game_id: game1.id)
UserGame.create(user_id: agustin.id, game_id: game2.id)
UserGame.create(user_id: agustin.id, game_id: game3.id)
UserGame.create(user_id: ana.id, game_id: game1.id)
UserGame.create(user_id: ana.id, game_id: game2.id)
UserGame.create(user_id: marina.id, game_id: game2.id)
UserGame.create(user_id: marina.id, game_id: game4.id)
UserGame.create(user_id: marina.id, game_id: game5.id)
UserGame.create(user_id: joanna.id, game_id: game2.id)
UserGame.create(user_id: joanna.id, game_id: game3.id)
UserGame.create(user_id: joanna.id, game_id: game5.id)
UserGame.create(user_id: emily.id, game_id: game1.id)
UserGame.create(user_id: emily.id, game_id: game2.id)
UserGame.create(user_id: emily.id, game_id: game3.id)


puts 'Creating appointments...'
# Paul's upcoming appointments

puts "Paul x Charlotte"
appointment1 = Appointment.create(address: "Le Wagon, Berlin", date: Date.today, start_time: Time.now,
                                   end_time: Time.now + 2.hours, game_id: game2.id, user_match_id: user_match5.id, status: 'pending')

puts "Paul x Baran"
appointment2 = Appointment.create(address: 'Chupenga', date: Date.today + 2, start_time: Time.now,
                                  end_time: Time.now + 3.hours, game_id: game3.id, user_match_id: user_match4.id, status: 'pending')

puts "Paul x Katharine"
appointment3 = Appointment.create(address: 'Charlotte I Pizza', date: Date.today + 5, start_time: Time.now,
                                  end_time: Time.now + 3.hours, game_id: game5.id, user_match_id: user_match2.id, status: 'approved')

# Paul's past appointments
puts "Paul x Antonio"
appointment4 = Appointment.create(address: "Antonio's balcony", date: Date.today - 2, start_time: Time.now - 2.hours,
                                  end_time: Time.now, game_id: game1.id, user_match_id: user_match1.id, status: 'approved')

puts "Paul x Emma"
appointment5 = Appointment.create(address: "Paul's castle", date: Date.today - 3, start_time: Time.now + 3.hours,
                                  end_time: Time.now + 6.hours, game_id: game5.id, user_match_id: user_match3.id, status: 'approved')

puts "Paul x Emma"
appointment8 = Appointment.create(address: "Paul's castle", date: Date.today - 3, start_time: Time.now + 3.hours,
                                  end_time: Time.now + 6.hours, game_id: game1.id, user_match_id: user_match3.id, status: 'approved')

puts "Paul x Baran"
appointment6 = Appointment.create(address: "Charlotte I Pizza", date: Date.today - 4, start_time: Time.now - 4.hours,
                                  end_time: Time.now, game_id: game3.id, user_match_id: user_match4.id, status: 'approved')

puts "Antonio x Katharine"
appointment7 = Appointment.create(address: "Eleganzina", date: Date.today - 4, start_time: Time.now - 4.hours,
                                  end_time: Time.now, game_id: game3.id, user_match_id: user_match6.id, status: 'approved')

puts 'Creating reviews...'
Review.create(content: "Emma is a cheater!!!", rating: 1, appointment_id: appointment5.id, user_id: paul.id)
Review.create(content: "Na ja 🤷🏻‍♂", rating: 3, appointment_id: appointment8.id, user_id: paul.id)
Review.create(content: "Meh 😐", rating: 3, appointment_id: appointment7.id, user_id: katharine.id)
