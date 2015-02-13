class Game < ActiveRecord::Base
  belongs_to :player_red, :class_name => 'User', :foreign_key => 'player_id_red'
  belongs_to :player_black, :class_name => 'User', :foreign_key => 'player_id_black'
end

  