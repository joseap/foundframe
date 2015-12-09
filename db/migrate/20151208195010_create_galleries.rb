class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.float :longitude
      t.float :latitude
      t.integer :user_id
      
      t.timestamps null: false
    end
  end
end
