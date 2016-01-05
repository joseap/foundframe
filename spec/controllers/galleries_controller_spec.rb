require 'rails_helper'

RSpec.describe GalleriesController, :type => :controller do
	describe 'GET index' do 
		it "assigns @galleries" do 
			galleries = Gallery.all
			get :index
		end

		it "shows index of galleries" do
			get :index
			expect(response).to render_template('index')
		end
	end
end

