class UserGamesController < ApplicationController
  def create
    if UserGame.create(user_id: current_user.id, game_id: params[:game_id])
      redirect_to games_path
    else
      render :new
    end
  end
end
