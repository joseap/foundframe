class Issue < ActiveRecord::Base
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>", big: "900x600>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
	validates_presence_of :issue_number, :issue_title, :issue_description, :avatar
	validates_uniqueness_of :issue_number

	validates :issue_description, presence: true, length: { maximum: 1000 }
	
	belongs_to :user
end
