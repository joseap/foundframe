class PhotographersController < ApplicationController
	before_action :set_photog, only: [:show, :edit, :update, :destroy]
	def index
		@photographers = Photographer.all
		if @photographer.present?
			flash[:all_photogs] = "List of Photographers"
		else
			flash[:no_photog] = "No features were found"
		end
	end

	def show
		 @previous = Photographer.where("id < ?", params[:id]).order(:id).last	   
		 @next = Photographer.where("id > ?", params[:id]).order(:id).first 
	end

	def new
		@photographer = Photographer.new
	end

	def edit
	end

	def create
		@photographer = Photographer.create(photog_params)
		if @photographer.save
			flash[:new_photographer_created] = "New Feature Posted"
			redirect_to photographers_path
		else
			flash[:correct_form] = "Please fill the form correctly"
			render :new
		end
	end

	def update
		@photographer.update(photog_params)
		flash[:updated] = "Feature Updated"
		redirect_to photographers_path
	end

	def destroy
		@photographer.destroy
		flash[:deleted] = "Photographer deleted"
		redirect_to photographers_path
	end

	private
	def set_photog
		@photographer = Photographer.find(params[:id])
	end

	def photog_params
		params.require(:photographer).permit(:name, :project, :description, :avatar)
	end
end
