class CreatePrefectures < ActiveRecord::Migration
  def change
    create_table :prefectures do |t|
      t.string :prefecture_name, :limit => 10, :null => false
      t.timestamps
    end
  end
end
