class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :last_name, :limit => 20, :null => false
      t.string :first_name, :limit => 20, :null => false
      t.string :last_en_name, :limit => 20
      t.string :first_en_name, :limit => 20
      t.string :nick_name, :limit => 20
      t.integer :jersey_number
      t.references :position
      t.integer :gender, :limit => 1, :null => false, :default => 1
      t.string :address, :limit => 30
      t.string :birth_place, :limit => 30
      t.date :birthday
      t.text :image_url

      t.timestamps
    end
    add_index :members, :position_id   end
end
