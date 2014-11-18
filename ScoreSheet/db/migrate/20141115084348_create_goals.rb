class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.references :game, :null => false
      t.integer :period, :null => false, :default => 1
      t.integer :goal_min, :null => false
      t.integer :goal_sec, :null => false
      t.integer :goal_member_id, :null => false
      t.integer :assist1_member_id
      t.integer :assist2_member_id

      t.timestamps
    end
  end
end
