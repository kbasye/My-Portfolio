class EntriesController < ApplicationController
	def index
		Entry.goodreads
		@entries = Entry.find(:all, :order => 'original_created_at')
	end

	def show
		if Entry.exists?(params[:id])
			@entry = Entry.find(params[:id])
		else
			redirect_to root_url 
		end
	end

	def destroy
		Entry.destroy(params[:id])
		redirect_to entries_path
	end
end
