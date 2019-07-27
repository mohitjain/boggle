require_relative "../presenters/game"
require_relative "../services/create_game"
class GamesController < ApplicationController

  def create
    game = CreateGame.new(
      duration: params[:duration],
      random: params[:random],
      input_board: params[:board]
    ).execute

    render json: Presenters::Game.new(
      game
    ).to_json, status: :created
  end
end
