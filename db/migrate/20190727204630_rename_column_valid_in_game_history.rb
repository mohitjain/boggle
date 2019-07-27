class RenameColumnValidInGameHistory < ActiveRecord::Migration[5.2]
  def change
    rename_column :game_histories, :valid, :accepted 
  end
end
