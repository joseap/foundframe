class CreateExhibitions < ActiveRecord::Migration
  def change
    create_table :exhibitions do |t|
      t.string :artist
      t.string :name
      t.datetime :date
      t.integer :user_id
      t.integer :gallery_id

      t.timestamps null: false
    end
  end
end
