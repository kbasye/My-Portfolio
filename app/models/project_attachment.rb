class ProjectAttachment < ActiveRecord::Base
	attr_accessible :attachment, :caption, :attachment_file_name

	belongs_to :project

	has_many :attachments, :dependent => :destroy
	has_attached_file :attachment, 
		:storage => :dropbox,
		:dropbox_credentials => Rails.root.join("config/dropbox.yml"),
		:path => ':id/:style/:filename'
end