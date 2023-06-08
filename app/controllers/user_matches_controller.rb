class UserMatchesController < ApplicationController
  def index
    @user_matches = UserMatch.all
  end

  def new
    @potential_match = User.all.sample
    @user_match = UserMatch.new
  end

  def create
    # TODO: check if UserMatch already exists, otherwise create it. Status will be either pending (if the current user liked the proposed user) or declined
    match = Match.create!(secondary_user_id: params[:user_match][:match_id])
    user_match = UserMatch.new(user_match_params)
    user_match.user_id = current_user.id
    user_match.match_id = match.id
    user_match.save!
    redirect_to new_user_match_path
  end

  private

  def user_match_params
    params.require(:user_match).permit(:status)
  end
end
