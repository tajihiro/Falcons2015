class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.string :season_name, :limit => 30, :null => false
      t.string :season_start, :limit => 8
      t.string :season_end, :limit => 8

      t.timestamps
    end
  end
end
