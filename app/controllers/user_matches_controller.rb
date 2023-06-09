# frozen_string_literal: true

# Top-level documentation comment
class UserMatchesController < ApplicationController
  before_action :set_potential_match, only: %i[new create]

  def index
    @user_matches = UserMatch.where(status: 'approved').where('user_id = ? OR match_id IN (SELECT id FROM matches WHERE secondary_user_id = ?)', current_user.id, current_user.id)
  end

  def new
    # The code below will be used in the view to determine
    # if the form presented to the user should have a post or put method
    @user_match_exists = user_match_exists
    @user_match_exists ? set_user_match : @user_match = UserMatch.new
    # raise
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
    set_user_match
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

  def set_potential_match
    # Exclude current user:
    potential_matches = User.where.not(id: current_user.id)
    # Exclude users with whom a user_match exists and:
    # secondary_user_id: current_user.id and status: 'denied' (current user won't see users who disliked his profile)
    fucking_users = []
    fucking_user_matches = UserMatch.joins(match: :secondary_user).where(status: ['denied', 'approved'], matches: { secondary_user_id: current_user.id })

    fucking_user_matches.each do |user_match|
      fucking_users.push(user_match.user)
    end
    # OR
    # user_id: current_user.id (current user won't see users he has already voted)
    already_voted_users = []
    user_matches_where_current_user_voted = UserMatch.where(user_id: current_user.id)

    user_matches_where_current_user_voted.each do |user_match|
      already_voted_users.push(user_match.match.secondary_user)
    end
    @potential_match = (potential_matches - fucking_users - already_voted_users).sample
  end

  def user_match_params
    params.require(:user_match).permit(:status)
  end
end
