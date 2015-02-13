class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  def email_required?
    false
  end

  def email_changed?
    false
  end


  def red_games
  	Game.where(player_id_red: self.id)
  end

  def black_games
  	Game.where(player_id_black: self.id)
  end

  def games
    red_games + black_games
  end

  def all_games  # Brit's Slack eg. alt
    Game.where("player_id_black = ? OR player_id_red = ?", self.id, self.id)
  end
end
