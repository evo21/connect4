# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Game.delete_all

phil = User.create(username: 'phil', password: '12341234', email: "p@p.com")
evan = User.create(username: 'evan', password: '12341234', email: "e@p.com")
bill = User.create(username: 'bill', password: '12341234', email: "b@p.com")
biff = User.create(username: 'biff', password: '12341234', email: "biff@p.com")

Game.create(player_id_red: phil.id, player_id_black: evan.id )
Game.create(player_id_red: bill.id, player_id_black: biff.id )
Game.create(player_id_red: bill.id, player_id_black: phil.id )