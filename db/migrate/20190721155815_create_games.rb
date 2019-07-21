class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.integer :board_id, null: false
      t.integer :duration, null: false
      t.string :token, null: false
      t.integer :points, default: 0, null: false
      t.timestamps
    end

    add_index :games, :token, unique: true
  end
end
