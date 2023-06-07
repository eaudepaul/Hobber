class GamesController < ApplicationController
  def index
    if params[:query].present?
      @games = Game.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @games = Game.all
    end
    @user_games = current_user.games
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
