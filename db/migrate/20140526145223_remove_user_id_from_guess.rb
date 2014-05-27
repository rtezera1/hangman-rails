class RemoveUserIdFromGuess < ActiveRecord::Migration
  def change
    remove_column :guesses, :user_id
  end
end
