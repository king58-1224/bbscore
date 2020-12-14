class GamesController < ApplicationController
  def index
    @game = Game.all
  end

  def new
    binding.pry
    @game = Game.new
    @game.batting_orders.build
  end

  def create
    binding.pry
    @game = Game.new(games_params)
    @game.save
    redirect_to root_path
  end

  private

  def games_params
    params.require(:game).permit(:game_name, :game_day, batting_orders_attributes: [:member_id, :batting_number, :position_id]).merge(team_id: current_team.id)
  end
end
