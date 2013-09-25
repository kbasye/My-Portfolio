class ApplicationController < ActionController::Base
  def index
	@projects = Project.order('created_at DESC')
  end
end