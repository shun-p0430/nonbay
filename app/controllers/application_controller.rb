class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:signup, keys: [:nickname, :aroma_id, :impression_id, :taste_id, :afterglow_id])
  end
end
