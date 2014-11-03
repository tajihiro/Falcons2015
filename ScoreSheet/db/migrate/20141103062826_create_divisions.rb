class CreateDivisions < ActiveRecord::Migration
  def change
    create_table :divisions do |t|
      t.string :division_name, :limit => 30, :null => false
      t.string :division_en_name, :limit => 30

      t.timestamps
    end
  end
end
