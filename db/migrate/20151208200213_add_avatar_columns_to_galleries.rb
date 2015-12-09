class AddAvatarColumnsToGalleries < ActiveRecord::Migration
  def change
  	add_attachment :galleries, :avatar
  end
end
