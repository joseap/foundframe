class ExhibitionsController < ApplicationController
	def index
		@exhibitions = Exhibition.all 
	end

	def new
		@exhibition = Exhibition.new
	end

	def show
		@exhibition = Exhibition.find(params[:id])
		@exhibitions = Exhibition.all
		@gallery = Gallery.find(params[:gallery_id])

	    respond_to do |format|
	      format.html
	      format.ics do
	        cal = Icalendar::Calendar.new
	          event = Icalendar::Event.new
	          event.dtstart = @exhibition.date
	          event.dtend = @exhibition.end_date
	          event.summary = @exhibition.name.titleize
	          cal.add_event(event)
	        cal.publish
	        render :text =>  cal.to_ical 
	      end
	    end
	end

	def create
		Exhibition.create(artist: params[:exhibition][:artist], 
			name: params[:exhibition][:name], 
			date: params[:exhibition][:date], 
			end_date: params[:exhibition][:end_date],
			avatar: params[:exhibition][:avatar],
			gallery_id: params[:gallery_id], 
			user_id: session[:user_id])

		redirect_to	gallery_path(params[:gallery_id])
	end

	def edit 
		@exhibition = Exhibition.find(params[:id])
	end

	def update 
		@exhibition = Exhibition.find(params[:id])
		@exhibition.update(exhibition_params)
		redirect_to exhibitions_path
	end

	def destroy
		@exhibition = Exhibition.find(params[:id])
		@exhibition.destroy
		redirect_to exhibitions_path
		flash[:destroyed] = "Exhibition deleted"
	end

	private 
	def exhibition_params
		params.require(:exhibition).permit(:artist, :name, :date, :end_date, :avatar)
	end
end
