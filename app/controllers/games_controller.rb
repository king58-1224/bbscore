class GamesController < ApplicationController
  before_action :authenticate_team!, only: :new
  MEMBER_COUNT = 9
  
  def index
  end

  def new
    count = Member.where(team_id: current_team).count
    if count >= MEMBER_COUNT
      @game = Game.new
      MEMBER_COUNT.times { @game.batting_orders.build }
    else
      return redirect_to new_member_path
    end
  end

  def create
    @game = Game.new(games_params)

    if @game.valid?
      @game.save
      redirect_to root_path
    else
      render new
    end
  end

  private

  def games_params
    params.require(:game).permit(:game_name, :game_day,
      batting_orders_attributes: [:member_id, :batting_number, :position_id]).merge(team_id: current_team.id)
  end

end
