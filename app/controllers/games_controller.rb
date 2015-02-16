class GamesController < ApplicationController
  

  def index
  	Game.where("player_id_black = ? OR player_id_red = ?", self.id, self.id)
  end

  def new
    @game = Game.create
  end

  def show
    binding.pry
  current_user.all_games  
  end


  def move
    @game.drop
  end

  def join
  end

  def game_params

  end
end
