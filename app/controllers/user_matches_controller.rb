class UserMatchesController < ApplicationController
  def index
    @user_matches = UserMatch.all
  end

  def new
    @user_match = UserMatch.new
  end
end
