class User < ActiveRecord::Base
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>", big: "900x600>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

	has_many :galleries
	has_many :photographers
	has_many :exhibitions

	# BEFOR VALIDATION
	before_validation :ensure_username_has_a_value
	before_validation :normalize_username, on: :create # AVOID CONFLICTING CAPS 

	# USER VALIDATION
	validates_uniqueness_of :username
	validates :email, confirmation: true, presence: true
	validates :password, confirmation: true, presence: true, length: { minimum: 5 }
	validates_presence_of :username, :email, :password, :avatar

	protected
	# USERNAME = EMAIL IF USERNAME NOT PRESENT
	 def ensure_username_has_a_value
	 	if username.nil?
	 		self.username = email unless email.blank?
	 	end
	 end

	 # MAKES USERNAME LOWER CAPS TO AVOID CONFLICTS OR TYPOS
 	 def normalize_username
       self.username = self.username.downcase
     end
end
