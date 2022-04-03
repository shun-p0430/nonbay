class ReviewsController < ApplicationController
  def index
    # require 'json'
    # uri = URI.parse('https://muro.sakenowa.com/sakenowa-data/api/areas')
    # json = Net::HTTP.get(uri)
    # @areas = JSON.parse(json, symbolize_names: true)
    # @review = Review.new
  end

  def new
    @brand = Brand.find(params[:brand_id])
    @review = Review.new
  end

  def create
    @brand = Brand.find(params[:brand_id])
    @review = Review.new(review_params)
    if @review.save
      redirect_to controller: :brands, action: :show, id: params[:brand_id]
      aroma = Review.where(brand_id: @brand.id).average(:aroma_id)
      impression = Review.where(brand_id: @brand.id).average(:impression_id)
      taste = Review.where(brand_id: @brand.id).average(:taste_id)
      afterglow = Review.where(brand_id: @brand.id).average(:afterglow_id)
      Brand.where(id: @brand.id).update(aroma: aroma, impression: impression, taste: taste, afterglow: afterglow)
    else
      render :new
    end
  end

  private
  def review_params
    params.require(:review).permit(:aroma_id, :impression_id, :taste_id, :afterglow_id, :comment).merge(user_id: current_user.id, brand_id: params[:brand_id])
  end
end
