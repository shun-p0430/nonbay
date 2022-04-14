class ReviewsController < ApplicationController
  before_action :set_brand, only: [:new, :create]
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @reviews = Review.includes(:user).order("updated_at DESC").limit(15)
  end

  def new
    @review = Review.new
  end

  def create
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

  def set_brand
    @brand = Brand.find(params[:brand_id])
  end
end
