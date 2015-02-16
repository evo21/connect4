class Game < ActiveRecord::Base
  belongs_to :player_red, :class_name => 'User', :foreign_key => 'player_id_red'
  belongs_to :player_black, :class_name => 'User', :foreign_key => 'player_id_black'
  serialize :board
  after_initialize :load
  
  

  # def player
  #   if self.turn_count.
  # end


  def row(place)
    self.board[place-1]
  end

  def colum(place)
   self.board.transpose[place-1]
  end

  def drop
    5.downto(0) do |spot|
    if self.colum[spot] == "red" || "black"
        self.colum[spot] = ""
        break
      end
    end
    self.turn_count += 1
  end

  

  
def win_check
  self.turn_count > 7
  horizantal
  vertical
  diagnal
end


  def horizantal
    self.board.each do |x|
      horz = x.join
      if horz.include?("")
      end
    end
  end

    def vertical 
      self.board.transpose.each do |x|
        vertical = x.join
        if vertical.include?("")
        end
      end
    end

      def diagnal(player)
        diag1 =[board[5][0] + board[4][1] + board[3][2] + board[2][3] + board[1][4] + board[0][5]]
        diag2 =[board[3][0] + board[2][1] + board[1][2] + board[0][3]]
        diag3 =[board[3][1] + board[2][2] + board[1][3] + board[0][4] + board[4][0]]
        diag4 =[board[5][1]+ board[4][2]+ board[3][3]+board[2][4]+board[1][5]+board[0][6]]
        diag5 =[board[5][2]+board[4][3]+board[3][4]+board[2][5]+board[1][6]]
        diag6 =[board[5][3] +board[4][4]+board[3][5]+board[2][6]]
        case self.turn_count > 7
        when diag1[0].include?()
          when diag1[0].include?()
            when diag1[0].include?()
              when diag1[0].include?()
                when diag1[0].include?()
                  when diag1[0].include?()
                    game_over
        end
    end



    def load
      self.board = Array.new(6){Array.new(7, "O")}.to_a
      self.save
    end


end

  


  