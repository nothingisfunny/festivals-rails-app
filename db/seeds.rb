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
    website: "www.lollapalooza.com")
festival2 = Festival.create(
	name: "Hurricane",
    location: "Eichenring, Scheessel",
    venue: "outdoors",
    line_up: "Green Day, Linkin Park, Blink-192, Editors, and more",
    start: "2017-06-23",
    end: "2017-06-25",
    website: "www.hurricane.de")
festival3 = Festival.create(
	name: "Pukkelpop",
    location: "Belgium",
    venue: "outdoors",
    line_up: "TBD",
    start: "2017-08-16",
    end: "2017-08-19",
    website: "www.pukkelpop.be")
festival4 = Festival.create(
	name: "16th Annual Tribeca Film Festival",
    location: "New York, NY",
    venue: "Multiple theatres",
    line_up: "TBD",
    start: "2017-04-19",
    end: "2017-04-30",
    website: "www.tribecafilm.com")
festival1.category_id = category2.id
festival1.save
festival2.category_id = category2.id
festival2.save
festival3.category_id = category2.id
festival3.save
festival4.category_id = category1.id
festival4.save

