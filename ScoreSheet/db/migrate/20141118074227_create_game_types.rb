class CreateGameTypes < ActiveRecord::Migration
  def change
    create_table :game_types do |t|
      t.string :game_type, :limit => 10, :null => false

      t.timestamps
    end
  end
end
