class SessionsController < ActionController::Base
	def new
		if session[:auth_token] && User.exists?(session[:auth_token])
			redirect_to root_url
		else
			render 'new'
		end
	end
	
	def create
		if User.exists?(:username => params[:username])
			@user = User.find_by_username(params[:username])
			if @user.authenticate(params[:password])
				session[:auth_token] = @user.auth_token
				redirect_to root_url
			end
		else
			render 'new'
		end
	end

	def destroy
		session.clear
		redirect_to root_url
	end
end