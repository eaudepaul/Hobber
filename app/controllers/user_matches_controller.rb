class UserMatchesController < ApplicationController
  def index
    @user_matches = UserMatch.all
  end

  def new
  end

  def create
    potential_match_id = params[:user_id]
    @match = Match.new(secondary_user_id: potential_match_id)
    @match.save!
      # TODO: check if UserMatch already exists, otherwise create it. Status will be either pending (if the current user liked the proposed user) or declined
    UserMatch.create(user_id: current_user.id, match_id: @match, status: 'pending')
    redirect_to new_user_user_match_path(user_id: User.all.sample.id)
  end
end
