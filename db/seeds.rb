# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'uri'
require 'json'

uri = URI.parse('https://muro.sakenowa.com/sakenowa-data/api/brands')
json = Net::HTTP.get(uri)
arr = JSON.parse(json[0][:brands])
arr.each do |data|
  Brand.create(column1:data['name'], column2:data['breweryId'])
end