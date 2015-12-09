class GalleriesController < ApplicationController
	def index
		@galleries = Gallery.all
		if @gallery.present?
			flash[:notice] = "Post List"
		else
			flash[:alert] = "No Posts Found"
		end
	end

	def show
		@gallery = Gallery.find(params[:id])
	end

	def new
		@gallery = Gallery.new
		@gallery = Gallery.new
	end

	def edit
		@gallery = Gallery.find(params[:id])
	end

	def create
		@gallery = Gallery.create(name: params[:gallery][:name], 
				address: params[:gallery][:address], 
				phone: params[:gallery][:phone], 
				avatar: params[:gallery][:avatar],
				user_id: session[:user_id])

		if @gallery.save
			flash[:gallery_created] = "New Gallery created"
			redirect_to galleries_path
		else
			flash[:correct_gallery] = "Please fill the form correctly. \n Title should contain at least 5 characters"
			render :new
		end
	end

	def update 
		@gallery = Gallery.find(params[:id])
		@gallery.update(gallery_params)
		flash[:updated] = "Gallery Info updated"
		redirect_to galleries_path
	end

	def destroy
		@gallery = Gallery.find(params[:id])
		@gallery.destroy
		flash[:deleted] = "Gallery deleted"
		redirect_to	galleries_path
	end

	private
	def gallery_params
		params.require(:gallery).permit(:name, :address, :phone, :avatar)
	end
end
