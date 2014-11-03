class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string :position_name, :limit => 8, :null => false

      t.timestamps
    end
  end
end
