class AddAvatarColumnsToExhibitions < ActiveRecord::Migration
  def change
  	add_attachment :exhibitions, :avatar
  end
end
