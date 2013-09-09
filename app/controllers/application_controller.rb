class ApplicationController < ActionController::Base
  def index
	@projects = Project.all
	render :layout => 'application'  	
  end
end