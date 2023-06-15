# frozen_string_literal: true

# Top-level documentation comment
class UserMatchesController < ApplicationController
  before_action :set_potential_match, only: %i[new]

  def index
    @user_matches = UserMatch.where(status: 'approved').where(
      'user_id = ? OR match_id IN (SELECT id FROM matches WHERE secondary_user_id = ?)', current_user.id, current_user.id
    )
  end

  def new
    # The code below will be used in the view to determine
    # if the form presented to the user should have a post or put method
    @user_match_exists = @potential_match.nil? ? false : user_match_exists
    @user_match = @user_match_exists ? set_user_match : UserMatch.new
    @user_games = UserGame.where(user_id: current_user.id)
    @chatroom = @user_match_exists ? set_chatroom : 'no-chatroom'
  end

  def create
    match = Match.create!(secondary_user_id: params[:user_match][:match_id])
    @user_match = UserMatch.new(status: params[:user_match][:status])
    @user_match.user_id = current_user.id
    @user_match.match_id = match.id
    @user_match.save!
    if @user_match.status == 'pending'
      @chatroom = Chatroom.create!(user_match: @user_match,
                                   name: @user_match.user == current_user ? @user_match.match.secondary_user.username : @user_match.user.username)
    end
    redirect_to new_user_match_path
  end

  def update
    @user_match = UserMatch.find(params[:id])
    render :new, status: :unprocessable_entity unless @user_match.update(status: params[:user_match][:status])
  end

  def user_match_exists
    UserMatch.joins(:match).exists?(matches: { secondary_user_id: current_user.id }, user_id: @potential_match.id)
  end

  private

  def set_user_match
    # Check if a UserMatch instance exists where match_id.secondary_user_id matches current_user.id.
    # There is a naming conflict with the match keyword, which is a reserved keyword in PostgreSQL.
    # To resolve the issue, we use joins(:match) to perform an inner join with the matches table.
    # Then, we use where(matches: { secondary_user_id: current_user.id }) to specify the condition for the join.
    UserMatch.joins(:match).find_by(matches: { secondary_user_id: current_user.id }, user_id: @potential_match.id)
  end

  def set_chatroom
    Chatroom.find_by(user_match_id: @user_match.id)
  end

  def set_potential_match
    @potential_matches_except_current_user = User.where.not(id: current_user.id)

    @users_with_common_games = @potential_matches_except_current_user.joins(:games).where(games: { id: current_user.games })

    @users_that_current_user_voted_1st = []
    @user_matches_where_current_user_voted_1st = UserMatch.where(user_id: current_user.id)
    @user_matches_where_current_user_voted_1st.each do |user_match|
      @users_that_current_user_voted_1st.push(user_match.match.secondary_user)
    end

    @users_that_disliked_current_user = []
    @user_matches_where_current_user_was_disliked = UserMatch.joins(match: :secondary_user).where(status: 'denied',
                                                                                                  matches: { secondary_user_id: current_user.id })
    @user_matches_where_current_user_was_disliked.each do |user_match|
      @users_that_disliked_current_user.push(user_match.user)
    end

    @users_that_liked_current_user = []
    @user_matches_where_current_user_was_liked = UserMatch.joins(match: :secondary_user).where(status: 'pending',
                                                                                               matches: { secondary_user_id: current_user.id })
    @user_matches_where_current_user_was_liked.each do |user_match|
      @users_that_liked_current_user.push(user_match.user)
    end

    @users_that_current_user_liked_back = []
    @approved_user_matches = UserMatch.where(status: 'approved')
    @approved_user_matches.each do |user_match|
      @users_that_current_user_liked_back.push(user_match.user)
    end

    @potential_match = (@users_with_common_games - @users_that_current_user_voted_1st - @users_that_disliked_current_user - @users_that_current_user_liked_back).sample
  end
end
