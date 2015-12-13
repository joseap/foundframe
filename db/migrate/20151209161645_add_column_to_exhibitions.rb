class AddColumnToExhibitions < ActiveRecord::Migration
  def change
  	add_column :exhibitions, :date, :date
  end
end
