class UserMatchesController < ApplicationController
  def index
    @user_matches = UserMatch.all
  end

  def new
    @user_match = UserMatch.new
  end

  def create
    @user_match = UserMatch.new(user_match_params)
    if @user_match.save
      redirect_to user_matches_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_match_params
    params.require(:user_match).permit(:user_id, :secondary_user_id, :status)
  end
end
