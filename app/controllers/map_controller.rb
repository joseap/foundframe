class MapController < ApplicationController
	def show
		@galleries = Gallery.all

		@hash = Gmaps4rails.build_markers(@galleries) do |gallery, marker|
		  marker.lat gallery.latitude
		  marker.lng gallery.longitude
		  marker.infowindow "<h1>#{view_context.link_to gallery.name, gallery_path(gallery.id)}</h1>" + "<h2 style='font-style:italic'> #{gallery.address} </h2>" + "Website: #{view_context.link_to gallery.website, gallery.website, target: "_blank"}" + "<br/><br/>" + "<img src='#{ gallery.avatar.url(:medium) }'>"
		  marker.json({:name => gallery.id})
		end
	end
end
