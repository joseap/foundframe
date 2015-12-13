class AddEnddateToExhibitions < ActiveRecord::Migration
  def change
  	  add_column :exhibitions, :end_date, :date
  end
end
