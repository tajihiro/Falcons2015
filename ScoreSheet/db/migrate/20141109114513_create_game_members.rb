class CreateGameMembers < ActiveRecord::Migration
  def change
    create_table :game_members, :id => false do |t|
      t.references :game, :null => false
      t.references :member, :null => false
      t.integer :goal, :null => false, :default => 0
      t.integer :assist, :null => false, :default => 0
      t.integer :goal_against, :null => false, :default => 0
      t.integer :shots_against, :null => false, :default => 0
      t.float :penalties, :null => false, :default => 0
      t.integer :goalie_flg , :null => false, :default => 0
      t.integer :mvp_flg, :null => false, :default => 0

      t.timestamps
    end
  end
end
