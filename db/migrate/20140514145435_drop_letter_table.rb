class DropLetterTable < ActiveRecord::Migration
  def change
    drop_table :letters
  end
end
