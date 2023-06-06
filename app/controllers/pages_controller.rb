class PagesController < ApplicationController
  def index
    redirect_to new_user_user_match_path(user_id: User.all.sample.id) if user_signed_in?
  end
end
