class CreatePhotographers < ActiveRecord::Migration
  def change
    create_table :photographers do |t|
      t.string :name
      t.string :project
      t.text :description
      
      t.timestamps null: false
    end
  end
end
