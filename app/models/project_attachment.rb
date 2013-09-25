class ProjectAttachment < ActiveRecord::Base
	attr_accessible :attachment, :attachment_file_name, :caption, :title

	belongs_to :project

	has_many :attachments
	has_attached_file :attachment, 
		:styles => {:medium => "600x600>", :thumb => "300x300>"},
		:storage => :dropbox,
		:dropbox_credentials => Rails.root.join("config/dropbox.yml"),
		:path => ':id/:filename_:style'
end