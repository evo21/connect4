class ChangeBoardString < ActiveRecord::Migration
  def change
  	change_column :games, :board, :text
  end
end
