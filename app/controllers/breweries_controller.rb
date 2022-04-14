class BreweriesController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create]
  def show
    @brewery = Brewery.find(params[:id])
    @brands = @brewery.brands
  end

  def new
    @area = Area.find(params[:area_id])
    @brewery = Brewery.new
  end

  def create
    @area = Area.find(params[:area_id])
    @brewery = Brewery.new(brewery_params)
    if @brewery.save
      redirect_to action: :show, id: @brewery
    else
      render :new
    end
  end

  private
  def brewery_params
    params.require(:brewery).permit(:name).merge(area_id: @area.id)
  end
end
