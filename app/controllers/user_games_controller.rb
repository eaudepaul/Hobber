# frozen_string_literal: true

class UserGamesController < ApplicationController
  def create
    if UserGame.create(user_id: current_user.id, game_id: params[:game_id])
      flash[:notice] = "#{Game.find(params[:game_id]).name} has been added to your list of games."
      redirect_to games_path
    else
      render :new
    end
  end

  def destroy
    user_game = UserGame.find(params[:id])
    if user_game.destroy
      flash[:notice] = "#{Game.find(params[:game_id]).name} has been removed from your list of games."
      redirect_to games_path
    else
      render :new
    end
  end
end
