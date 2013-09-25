class ProjectAttachmentsController < ActionController::Base
	def destroy
		project_attachment = ProjectAttachment.find(params[:id])
		project_attachment.destroy
		redirect_to project_path(project_attachment.project)
	end
end