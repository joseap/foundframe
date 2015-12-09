class AddAvatarColumnsToPhotographers < ActiveRecord::Migration
  def change
  	add_attachment :photographers, :avatar
  end
end
