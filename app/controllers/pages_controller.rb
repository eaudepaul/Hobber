class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :test

  def test
  end

  def index
    # just to maintain functionality, readd once views have progressed
    # redirect_to new_user_user_match_path(user_id: User.all.sample.id) if user_signed_in?
  end
end
