class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :player_id_red
      t.integer :player_id_black
      t.integer :turn_count
      t.text :board
      t.boolean :winner
      t.timestamps null: false
    end
  end
end
