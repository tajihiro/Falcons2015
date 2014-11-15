class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.references :season, :null => false
      t.references :division, :null => false
      t.references :team, :null => false
      t.string :game_name, :limit => 60, :null => false
      t.integer :home_team_id, :null => false
      t.integer :home_team_p1_score, :null => false, :default => 0
      t.integer :home_team_p2_score, :null => false, :default => 0
      t.integer :home_team_ot_score, :null => false, :default => 0
      t.integer :home_team_score, :null => false, :default => 0
      t.integer :home_team_p1_shots, :null => false, :default => 0
      t.integer :home_team_p2_shots, :null => false, :default => 0
      t.integer :home_team_ot_shots, :null => false, :default => 0
      t.integer :home_team_shots, :null => false, :default => 0
      t.integer :away_team_id, :null => false
      t.integer :away_team_p1_score, :null => false, :default => 0
      t.integer :away_team_p2_score, :null => false, :default => 0
      t.integer :away_team_ot_score, :null => false, :default => 0
      t.integer :away_team_score, :null => false, :default => 0
      t.integer :away_team_p1_shots, :null => false, :default => 0
      t.integer :away_team_p2_shots, :null => false, :default => 0
      t.integer :away_team_ot_shots, :null => false, :default => 0
      t.integer :away_team_shots, :null => false, :default => 0
      t.date :game_date, :null => false
      t.time :game_time
      t.string :game_place, :limit => 120
      t.text :movie_url
      t.text :comments
      t.integer :disp_order, :default => 0
      t.integer :playoff_flg, :null => false, :default => 0

      t.timestamps
    end
  end
end
