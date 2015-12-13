class RemoveColumnFromExhibitions < ActiveRecord::Migration
  def change
  	remove_column :exhibitions, :date
  end
end
