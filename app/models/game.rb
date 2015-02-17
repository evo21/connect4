class Game < ActiveRecord::Base
  belongs_to :red_player, :class_name => 'User', :foreign_key => 'player_id_red'
  belongs_to :black_player, :class_name => 'User', :foreign_key => 'player_id_black'

  # REM for join table:  validates_length_of :users, maximum: 2, message: "can have at most two players"

  before_create :init_board, :init_turn_count

  serialize :board

  def user_playing?(user)
  	(user == self.red_player) || (user == self.black_player)
  end

  def number_of_players
  	numplayers = 0
  	numplayers = numplayers + 1 if self.player_id_red != nil
  	numplayers = numplayers + 1 if self.player_id_black != nil
    return numplayers
  end

  def init_turn_count
    self.turn_count = 1
  end

  def which_row(col)
    # given a column index, returns the available row index for the next move
    # if the bottom right is filled, 5,6, then we want 4,6 as the next location
    # so this function should return 4

    # if a column is empty, then this function should return 5 (the bottom row)

    # if a column is full, the the function should return nil

    # the column is the SECOND index of this array and does not change
    5.downto(0) do |i|
      return i if self.board[i][col] == nil
    end
    return nil  # if we get this far, the whole column's full
  end

  def init_board
  	#  xxxxxxx
  	#  xxxxxxx
  	#  xxxxxxx
  	#  xxxxxxx
  	#  xxxxxxx
  	#  xxxxxxx
  	self.board = Array.new
  	6.times do 
  	  self.board << Array.new(7)
  	  end
    end
end

 