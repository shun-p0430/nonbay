class BrandsController < ApplicationController
  def new
    @brand = Brand.new
  end
end
