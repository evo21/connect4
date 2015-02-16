class GamesController < ApplicationController
  before_action :authenticate_user!

  def index
  	@user = current_user
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
  end

  def new  	
    Game.create(player_id_red: current_user.id) ##
    #redirect_to game_path(@user)
    redirect_to games_path
  end

  def move
    @game = Game.find(params[:id])
    col = params[:col].to_i
    row = params[:row].to_i
    @game.board[row][col] = 'R'
    @game.save
    redirect_to game_path(@game)
  end

  def join
  end
end
