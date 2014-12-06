class CreateSeasonMembers < ActiveRecord::Migration
  def change
    create_table :season_members, :id => false do |t|
      t.references :season, :null => false
      t.references :division, :null => false
      t.references :team, :null => false
      t.references :members, :null => false

      t.timestamps
    end
  end
end
