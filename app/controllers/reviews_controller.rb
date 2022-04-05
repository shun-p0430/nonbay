class ReviewsController < ApplicationController
  before_action :set_brand, only: [:new, :create]
  def index
    @reviews = Review.includes(:user).order("updated_at DESC")
    if user_signed_in?
      user_aroma = User.find(current_user.id).aroma_id
      user_impression = User.find(current_user.id).impression_id
      user_taste = User.find(current_user.id).taste_id
      user_afterglow = User.find(current_user.id).afterglow_id
      query = "SELECT *
              FROM brands
              WHERE aroma between #{user_aroma} - 1 and #{user_aroma} + 1
              and impression between #{user_impression} - 1 and #{user_impression} + 1
              and taste between #{user_taste} - 1 and #{user_taste} + 1
              and afterglow between #{user_afterglow} - 1 and #{user_afterglow} + 1
              ORDER BY (abs(aroma - #{user_aroma}) + abs(impression - #{user_impression}) + abs(taste - #{user_taste}) + abs(afterglow - #{user_afterglow}))
              LIMIT 5"
      @recomends = Brand.find_by_sql(query)
    end
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
