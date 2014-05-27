class DropLetterGames < ActiveRecord::Migration
  def change
    remove_column :games, :letter 
  end
end
