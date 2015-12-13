class IssuesController < ApplicationController
	before_action :set_issue, except: [:index, :new, :create]
	def index
		@issues = Issue.all
	end

	def show
	end

	def new
		@issue = Issue.new
	end

	def edit
	end

	def create
		@issue = Issue.create(issue_params)
		if @issue.save 
			flash[:issue_created] = "New issue created"
			redirect_to issues_path
		else
			flash[:correct_form] = "Please fill out the form entirely and limit description to 1000 characters"
			render :new
		end

	end

	def update
		@issue.update(issue_params)
		flash[:updated] = "Issue Info updated"
		redirect_to issue_path
	end

	def destroy
		@issue.destroy
		flash[:deleted] = "Gallery deleted"
		redirect_to issues_path
	end

	private
		def issue_params
			params.require(:issue).permit(:issue_number, :issue_title, :issue_description, :avatar)
		end

		def set_issue
			@issue = Issue.find(params[:id])
		end

end
