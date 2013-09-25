class TagsController < ApplicationController
	def show
		if Tag.exists?(params[:id])
			@tag = Tag.find(params[:id]) 
			@taggings = @tag.taggings
		else
			redirect_to root_url
		end
	end
end
