class HomeController < ApplicationController
	def index
		@users = User.all
		@galleries = Gallery.all
		@exhibitions = Exhibition.all
		@photographers = Photographer.all
	end

	def show
	end

	def new
	end
end
