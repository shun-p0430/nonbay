require 'net/http'
require 'uri'
require 'json'

breweriesUri = URI.parse('https://muro.sakenowa.com/sakenowa-data/api/breweries')
breweriesJson = Net::HTTP.get(breweriesUri)
breweries = JSON.parse(breweriesJson)
breweries["breweries"].each do |brewery|
  begin
    data = Brewery.find_or_create_by(id: brewery['id'])
    data.update(id: brewery['id'], name: brewery['name'], area_id: brewery['areaId'])
    sleep 4.0
  rescue => e
    Rails.logger.debug e.message
  end
end

brandsUri = URI.parse('https://muro.sakenowa.com/sakenowa-data/api/brands')
brandsJson = Net::HTTP.get(brandsUri)
brands = JSON.parse(brandsJson)
brands["brands"].each do |brand|
  begin
    data = Brand.find_or_create_by(id: brand['id'])
    data.update(id: brand['id'], name: brand['name'], brewery_id: brand['breweryId'])
    sleep 4.0
  rescue => e
    Rails.logger.debug e.message
  end
end