class AddGameToLetter < ActiveRecord::Migration
  def change
    add_column :letters, :game_id, :integer
  end
end
