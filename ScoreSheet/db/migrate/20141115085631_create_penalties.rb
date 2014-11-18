class CreatePenalties < ActiveRecord::Migration
  def change
    create_table :penalties do |t|
      t.string :penalty_name, :limit => 30, :null => false

      t.timestamps
    end
  end
end
