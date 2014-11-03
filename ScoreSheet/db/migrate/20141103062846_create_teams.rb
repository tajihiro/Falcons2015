class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :team_name, :limit => 60, :null => false
      t.references :prefecture
      t.string :home_place, :limit => 30
      t.string :since, :limit => 8
      t.text :image_url

      t.timestamps
    end
  end
end
