class SessionsController < ActionController::Base
	def new
		if session[:auth_token] && User.exists?(session[:auth_token])
			redirect_to root_url
		else
			render 'new'
		end
	end
	
	def create
		@user = User.find_by_username(params[:username])
		if @user.authenticate(params[:password])
			session[:auth_token] = @user.auth_token
			redirect_to root_url
		else
			flash.now.alert = "Invalid email or password"
			render 'new'
		end
	end

	def destroy
		session.clear
		redirect_to root_url
	end
end