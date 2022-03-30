class ReviewsController < ApplicationController
  def index
    # require 'json'
    # uri = URI.parse('https://muro.sakenowa.com/sakenowa-data/api/areas')
    # json = Net::HTTP.get(uri)
    # @areas = JSON.parse(json, symbolize_names: true)
    # @review = Review.new
  end

  def new
    review = Review.new
end
