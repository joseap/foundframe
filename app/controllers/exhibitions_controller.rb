class ExhibitionsController < ApplicationController
	def new
		@exhibitions = Exhibition.new
	end

	def create
		Exhibition.create(artist: params[:exhibition][:artist], 
			name: params[:exhibition][:name], 
			date: params[:exhibition][:date], 
			gallery_id: params[:post_id], 
			user_id: session[:user_id])

		redirect_to	gallery_path(params[:gallery_id])
	end

	def edit 
		@exhibition = Exhibition.find(params[:id])
	end

	def update 
		@exhibition = Exhibition.find(params[:id])
		@exhibition.update(gallery_params)
	end

	def destroy
		@gallery = Gallery.find(params[:gallery_id])
		@exhibition = @gallery.exhibitions.find(params[:id])
		@exhibition.destroy
		redirect_to gallery_path(@gallery)
		flash[:destroyed] = "Exhibition deleted"
	end

	private 
	def exhibition_params
		params.require(:exhibition).permit(:artist, :name, :date, :avatar)
	end
end
