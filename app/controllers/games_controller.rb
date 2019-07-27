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
      game: game
    ).to_json, status: :created
  end

  # This should also take token as input and validate the ID + Token combination
  def show
    game = Game.find(params[:id])
    render json: Presenters::Game.new(
      game: game, additional_fields: true
    ).to_json
  end


end
