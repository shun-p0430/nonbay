class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @reviews = current_user.reviews.limit(5)
  end
end
