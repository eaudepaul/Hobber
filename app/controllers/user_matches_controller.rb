class UserMatchesController < ApplicationController
  def index
    @user_matches = UserMatch.all
  end

  def new
    @new_form = Match.where(secondary_user: current_user).exists?
    @potential_match = User.all.sample
    @user_match = UserMatch.new
  end

  def create

    match = Match.create!(secondary_user_id: params[:user_match][:match_id])
    # TODO: check if UserMatch already exists, otherwise create it. Status will be either pending (if the current user liked the proposed user) or declined
    UserMatch.create!(user_id: current_user.id, match_id: match.id, status: params[:status])
    redirect_to new_user_match_path
  end

  private

  def user_match_params
    params.require(:user_match).permit(:user_id, :match_id, :status)
  end
end
