class AreasController < ApplicationController
  before_action :set_user

  def index
    @areas = Area.all
  end

  def show
    @area = Area.find(params[:id])
    @breweries = @area.breweries
  end

  private
  def set_user
    @user = current_user
  end

end
