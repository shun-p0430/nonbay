class UsersController < ApplicationController
  def show
    @user = current_user
    @reviews = current_user.reviews.limit(5)
  end
end
