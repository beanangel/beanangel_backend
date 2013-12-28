# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

spots = YAML.load_file('test/fixtures/spots.yml')
spots.each do |key, values|
  attachments = [{file: File.open(Rails.root.join("test/assets/P8080027.JPG"))}]
  Spot.create(values.merge(attachments: attachments))
end