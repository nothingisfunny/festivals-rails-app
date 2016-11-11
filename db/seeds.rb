# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
category1 = Category.create(name: "Film")
category2 = Category.create(name: "Music")
user1 = User.create(name: "Lucya", email: "if.the.kids.r.united@gmail.com", password: "secret", password_confirmation: "secret")