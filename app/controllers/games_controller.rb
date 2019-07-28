require_relative "../presenters/game"
require_relative "../services/create_game"
require_relative "../services/play_game"

class GamesController < ApplicationController

  def create
    game = CreateGame.new(
      duration: params[:duration],
      random: params[:random],
      input_board: params[:board],
    ).execute

    render json: Presenters::Game.new(
      game: game
    ).to_json, status: :created
  end

  # This should also take token as input and validate the ID + Token combination
  def show
    game = Game.find(params[:id])
    render json: Presenters::Game.new(
      game: game,
      additional_fields: true,
    ).to_json
  end

  def update
    game = Game.where(
      id: params[:id],
      token: params[:token],
    ).first

    valid_word = PlayGame.new(
      game: game,
      word: params[:word],
    ).execute

    status = valid_word ? :ok : :bad_request

    render json: Presenters::Game.new(
      game: game,
      additional_fields: true,
    ).to_json, status: status
  end

end
