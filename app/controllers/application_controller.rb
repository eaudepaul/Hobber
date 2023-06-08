class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: :index
end
# before_action :set_time_zone, if: :user_signed_in?
