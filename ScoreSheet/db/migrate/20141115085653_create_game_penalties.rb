class CreateGamePenalties < ActiveRecord::Migration
  def change
    create_table :game_penalties do |t|
      t.references :game, :null => false
      t.references :penalty, :null => false
      t.integer :period, :null => false, :default => 1
      t.integer :penalty_min, :null => false
      t.integer :penalty_sec, :null => false
      t.float :penalty_time, :null => false, :default => 0
      t.integer :penalty_member_id, :null => false

      t.timestamps
    end
  end
end
