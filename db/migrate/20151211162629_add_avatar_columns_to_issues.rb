class AddAvatarColumnsToIssues < ActiveRecord::Migration
  def change
  	    add_attachment :issues, :avatar
  end
end
