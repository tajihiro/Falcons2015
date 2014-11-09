class CreateSeasonTeams < ActiveRecord::Migration
  def change
    create_table :season_teams, :id => false do |t|
      t.references :season, :null => false
      t.references :division, :null => false
      t.references :team, :null => false

      t.timestamps
    end
    add_index :season_teams, :season_id
    add_index :season_teams, :division_id
    add_index :season_teams, :team_id
  end
end
