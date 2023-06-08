# frozen_string_literal: true

# Top-level documentation comment
class UserMatchesController < ApplicationController
  def index
    @user_matches = UserMatch.all
  end

  def new
    @potential_match = User.all.sample
    @user_match_exists = user_match_exists
    @user_match_exists ? set_user_match : @user_match = UserMatch.new
  end

  def create
    match = Match.create!(secondary_user_id: params[:user_match][:match_id])
    user_match = UserMatch.new(user_match_params)
    user_match.user_id = current_user.id
    user_match.match_id = match.id
    user_match.save!
    redirect_to new_user_match_path
  end

  def update
    @user_match = UserMatch.joins(:match).find_by(matches: { secondary_user_id: current_user.id })
    redirect_to new_user_match_path if @user_match.update(user_match_params)
  end

  def user_match_exists
    UserMatch.joins(:match).where(matches: { secondary_user_id: current_user.id }).exists?
  end

  private

  def set_user_match
    # Check if a UserMatch instance exists where match_id.secondary_user_id matches current_user.id.
    # There is a naming conflict with the match keyword, which is a reserved keyword in PostgreSQL.
    # To resolve the issue, we use joins(:match) to perform an inner join with the matches table.
    # Then, we use where(matches: { secondary_user_id: current_user.id }) to specify the condition for the join.
    @user_match = UserMatch.joins(:match).find_by(matches: { secondary_user_id: current_user.id })
  end

  def user_match_params
    params.require(:user_match).permit(:status)
  end
end
