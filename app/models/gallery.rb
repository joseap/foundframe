class Gallery < ActiveRecord::Base
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>", big: "2000x1500>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
	
	geocoded_by :address   # can also be an IP address
	after_validation :geocode   # auto-fetch coordinates

	belongs_to :user
	has_many :exhibitions, dependent: :destroy

	validates :name, presence: true, length: { minimum: 5 }
	validates :address, presence: true, length: { minimum: 5}
end
