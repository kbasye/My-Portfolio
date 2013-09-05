module ApplicationHelper
	def current_user?
		true if session[:auth_token]
	end
end


