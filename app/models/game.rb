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

 