require 'net/http'
require 'uri'
require 'json'

brandsUri = URI.parse('https://muro.sakenowa.com/sakenowa-data/api/brands')
brandsJson = Net::HTTP.get(brandsUri)
brands = JSON.parse(brandsJson)
brands["brands"].each do |data|
  Brand.create(name: data['name'], brewery_id: data['breweryId'])
end

breweriesUri = URI.parse('https://muro.sakenowa.com/sakenowa-data/api/breweries')
breweriesJson = Net::HTTP.get(breweriesUri)
breweries = JSON.parse(breweriesJson)
breweries["breweries"].each do |data|
  Brewery.create(name: data['name'], area_id: data['areaId'])
end