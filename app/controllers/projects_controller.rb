class ProjectsController < ActionController::Base
	def new
		if session[:auth_token]
			@project = Project.new
			# @project.tags.build
		else
			redirect_to root_url
		end
	end

	def create
		@project = Project.new(params[:project])
		if @project.save
			# params[:project][:tags_attributes]["0"][:name].split(', ').each do |name|
			# 	tag = Tag.create(:name => name)
			# 	@project.tags << tag
			# end
			redirect_to project_path(@project)
		else
			render :new
		end
	end

	def index
		@projects = Project.all
	end

	def show
		if Project.exists?(params[:id])
			@project = Project.find(params[:id])
		else
			redirect_to root_url 
		end
	end

	def edit
		@project = Project.find(params[:id]) if Project.exists?(params[:id])
		if session[:auth_token]
			render :edit
		else
			redirect_to projects_path
		end
	end

	def update
		@project = Project.find(params[:id]) if Project.exists?(params[:id])
		if @project.update_attributes(params[:project])
			redirect_to project_path(@project)
		else
			render :edit
		end
	end

	def destroy
		Project.destroy(params[:id])
		redirect_to projects_path
	end
end