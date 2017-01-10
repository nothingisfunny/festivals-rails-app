# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
category1 = Category.create(name: "Film")
category2 = Category.create(name: "Music")
category3 = Category.create(name: "Other")
worldpart1 = WorldPart.create(name: "Africa")
worldpart2 = WorldPart.create(name: "Europe")
worldpart3 = WorldPart.create(name: "Asia")
worldpart4 = WorldPart.create(name: "North America")
worldpart5 = WorldPart.create(name: "Oceania")
worldpart6 = WorldPart.create(name: "South America")
worldpart7 = WorldPart.create(name: "Antarctica")
user1 = User.create(name: "Lucya", email: "if.the.kids.r.united@gmail.com", password: "secret", password_confirmation: "secret", role: :admin)
user2 = User.create(name: "Jamie", email: "bramiejim@gmail.com", password: "topsecret", password_confirmation: "topsecret")
user3 = User.create(name: "Polina", email: "whateverbeclever@gmail.com", password: "whatever", password_confirmation: "whatever")
user4 = User.create(name: "Olga", email: "4olgamalkina@gmail.com", password: "uvazhaemayaolga", password_confirmation: "uvazhaemayaolga")
festival1 = Festival.create(
	name: "Lollapalooza",
    location: "Chicago, IL",
    venue: "outdoors",
    line_up: "TBD",
    start: "2017-08-03",
    end: "2017-08-06",
    website: "www.lollapalooza.com",
    creator_id: user1.id,
    approved: true)
festival2 = Festival.create(
	name: "Hurricane",
    location: "Eichenring, Scheessel",
    venue: "outdoors",
    line_up: "Green Day, Linkin Park, Blink-192, Editors, and more",
    start: "2017-06-23",
    end: "2017-06-25",
    website: "www.hurricane.de",
    creator_id: user1.id,
    approved: true)
festival3 = Festival.create(
	name: "Pukkelpop",
    location: "Belgium",
    venue: "outdoors",
    line_up: "TBD",
    start: "2017-08-16",
    end: "2017-08-19",
    website: "www.pukkelpop.be",
    creator_id: user1.id,
    approved: true)
festival4 = Festival.create(
	name: "16th Annual Tribeca Film Festival",
    location: "New York, NY",
    venue: "Multiple theatres",
    line_up: "TBD",
    start: "2017-04-19",
    end: "2017-04-30",
    website: "www.tribecafilm.com",
    creator_id: user1.id,
    approved: true)
festival5 = Festival.create(
    name: "Sziget",
    location: "Budapest, Hungary",
    venue: "Hajógyári Island",
    line_up: "Kensington, Bad Religion, DJ Shadow, Mac DeMarco, Oh Wonder, Vince Staples, GusGus and GTA ",
    start: "2017-08-09",
    end: "2017-08-16",
    website: "http://szigetfestival.com",
    creator_id: user3.id,
    approved: true)
festival6 = Festival.create(
    name: "Sundance Film Festival",
    location: "Park City, Utah",
    venue: "Multiple Venues",
    line_up: "World Films",
    start: "2017-01-19",
    end: "2017-01-29",
    website: "http://www.sundance.org/festivals/sundance-film-festival",
    creator_id: user2.id,
    approved: true)

festival1.category_id = category2.id
festival1.world_part_id = worldpart4.id
festival1.save
festival2.category_id = category2.id
festival2.world_part_id = worldpart2.id
festival2.save
festival3.category_id = category2.id
festival3.world_part_id = worldpart2.id
festival3.save
festival3.save
festival4.category_id = category1.id
festival4.world_part_id = worldpart4.id
festival4.save
festival5.category_id = category2.id
festival5.world_part_id = worldpart2.id
festival5.save
festival6.category_id = category1.id
festival6.world_part_id = worldpart4.id
festival6.save

userfestival1 = UserFestival.create(user_id: user1.id, festival_id: festival1.id, status: "interested")
userfestival2 = UserFestival.create(user_id: user1.id, festival_id: festival2.id, status: "going")
userfestival2 = UserFestival.create(user_id: user1.id, festival_id: festival4.id, status: "going")

userfestival3 = UserFestival.create(user_id: user2.id, festival_id: festival1.id, status: "going")
userfestival4 = UserFestival.create(user_id: user2.id, festival_id: festival2.id, status: "interested")
userfestival5 = UserFestival.create(user_id: user2.id, festival_id: festival3.id, status: "going")

userfestival6 = UserFestival.create(user_id: user3.id, festival_id: festival3.id, status: "going")
userfestival7 = UserFestival.create(user_id: user3.id, festival_id: festival4.id, status: "interested")

userfestival8 = UserFestival.create(user_id: user4.id, festival_id: festival4.id, status: "going")



