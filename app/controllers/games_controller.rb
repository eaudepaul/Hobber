# frozen_string_literal: true

class GamesController < ApplicationController
  def index
    if params[:query].present?
      @games = Game.left_joins(:user_games).where('name ILIKE ?', "%#{params[:query]}%").group_by_name_and_count.first(5) # hash of game names as keys, and upvotes as value
      # take the line from above and limit by 5, take into account that it's a hash
    else
      @games = Game.joins(:user_games).group_by_name_and_count.first(5) # hash of game names as keys, and upvotes as value
    end
    @user_games = current_user.user_games # This an array of Game instances
    @user_game = UserGame.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      gametest = UserGame.new(user_id: current_user.id, game_id: @game.id)
      gametest.save!
        flash[:notice] = "#{@game.name} has been added to your list of games."
        redirect_to games_path
    else
      flash[:notice] = "#{@game.name} already exists. Try searching."
      redirect_to games_path
    end
  end

  private

  def game_params
    params.require(:game).permit(:name)
  end
end
