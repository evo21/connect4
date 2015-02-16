class GamesController < ApplicationController
  before_action :authenticate_user!, :only => [:join, :move]

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
    if @game.turn_count.odd?
      @game.board[row][col] = 'R'
    else
      @game.board[row][col] = 'B'
    end
    @game.turn_count += 1
    @game.save
    redirect_to game_path(@game)
  end 

  def join
    @game = Game.find(params[:id])
    @game.player_id_black = current_user.id
    @game.save
    binding.pry
    redirect_to games_path
  end
end
