class AddWebsiteToGalleries < ActiveRecord::Migration
  def change
  	add_column :galleries, :website, :string
  end
end
