class BreweriesController < ApplicationController
  def show
    @brewery = Brewery.find(params[:id])
    @brands = @brewery.brands
  end
end
