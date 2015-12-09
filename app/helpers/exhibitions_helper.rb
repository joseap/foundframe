module ExhibitionsHelper
	def show_exhib_bg
		"background:transparent url(#{@exhibition.avatar.url}) no-repeat center center fixed; 
		-webkit-background-size: cover;
		-moz-background-size: cover;
		-o-background-size: cover;
		background-size: cover;"
	end
end
