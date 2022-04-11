class ApplicationController < ActionController::Base
  before_action :basic_auth

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_recomends, if: :user_signed_in?

  private
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :aroma_id, :impression_id, :taste_id, :afterglow_id])
  end

  def set_recomends
    if user_signed_in?
      @user = current_user
      user_aroma = User.find(@user.id).aroma_id
      user_impression = User.find(@user.id).impression_id
      user_taste = User.find(@user.id).taste_id
      user_afterglow = User.find(@user.id).afterglow_id
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
end
