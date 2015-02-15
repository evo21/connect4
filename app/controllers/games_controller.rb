class GamesController < ApplicationController
  before_action :authenticate_user!

  def index
  	@user = current_user
  end

  def show
  end

  def new  	
    @game = Game.create(player_id_red: current_user[:id]) ##
    redirect_to game_path(@user)
  end

end
