class Admins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :admin_name, :limit => 20, :null => false

      t.timestamps
    end
  end
end
