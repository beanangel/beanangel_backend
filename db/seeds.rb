# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Spot.create(name: "train station", location: [50, 8], address: "Bahnhofsweg 4", city: "Frankfurt am Main", state: "Hesse")
Spot.create(name: "public park", location: [53, 11], address: "Fürtwängler Weg 9", city: "Köln", state: "Rhineland-Palatinate")