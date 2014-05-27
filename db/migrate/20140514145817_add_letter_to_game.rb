class AddLetterToGame < ActiveRecord::Migration
  def change
    add_column :games, :letter, :string
  end
end
