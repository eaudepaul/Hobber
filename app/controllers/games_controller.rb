class GamesController < ApplicationController
  def index
    if params[:query].present?
      @games = Game.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @games = Game.all
    end
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def game_params
    params.require(:games).permit(:name)
  end
end
