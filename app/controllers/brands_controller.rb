class BrandsController < ApplicationController
  def show
    @brand = Brand.find(params[:id])
    @reviews = @brand.reviews
  end
end
