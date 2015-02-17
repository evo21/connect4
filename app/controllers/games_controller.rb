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
    @user = current_user
    @game = Game.find(params[:id])
    col = params[:col].to_i
    row = @game.which_row(col)


    if @game.turn_count.odd?
      if @user.id == @game.player_id_red
        @game.board[row][col] = 'R'
        @game.turn_count += 1
      elsif
        @user.id == @game.player_id_black        
        @game.board[row][col] = nil
      end
    else
      if @user.id == @game.player_id_black
        @game.board[row][col] = 'B'
        @game.turn_count += 1
      elsif
        @user.id == @game.player_id_red
        @game.board[row][col] = nil
      end
    end

    @game.save

    redirect_to game_path(@game)
  end 

  def join
    @game = Game.find(params[:id])
    @game.player_id_black = current_user.id
    @game.save
    redirect_to games_path
  end
end
