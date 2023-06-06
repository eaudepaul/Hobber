class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :username, :age, :bio, :address])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :username, :age, :bio, :address])
  end
end
# before_action :set_time_zone, if: :user_signed_in?
