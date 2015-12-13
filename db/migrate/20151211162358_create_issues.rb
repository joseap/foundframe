class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
	  t.string :issue_number
	  t.string :issue_title
	  t.string :issue_description
	  t.integer :user_id

      t.timestamps null: false
    end
  end
end
