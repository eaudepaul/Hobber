class GamesController < ApplicationController
  def index
    if params[:query].present?
      @games = Game.left_joins(:user_games).where("name ILIKE ?", "%#{params[:query]}%").group_by_name_and_count# hash of game names as keys, and upvotes as value
    else
      @games = Game.joins(:user_games).group_by_name_and_count
    end
    @user_games = current_user.games # This an array of Game instances
    @user_game = UserGame.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to games_path
    else
      render :new
    end
  end

  private

  def game_params
    params.require(:game).permit(:name)
  end
end
