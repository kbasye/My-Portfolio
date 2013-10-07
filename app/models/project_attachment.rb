require 'open-uri'
class ProjectAttachment < ActiveRecord::Base
	attr_accessible :attachment, :attachment_file_name, :caption, :remote_url, :title

	belongs_to :project

	belongs_to :entry

	has_many :attachments
	has_attached_file :attachment, 
		:styles => {:medium => "600x600>", :thumb => "300x300>"},
		:storage => :dropbox,
		:dropbox_credentials => Rails.root.join("config/dropbox.yml"),
		:path => ':id/:filename_:style'

	before_validation :download_remote_attachment, :if => :remote_url_provided?
	validates_presence_of :remote_url, :if => :remote_url_provided?, :message => 'is invalid or inaccessible'

	private

	def remote_url_provided?
		!self.remote_url.blank?
	end

	def download_remote_attachment
		url = open(URI.parse(remote_url))
		self.attachment = url
		# self.attachment_file_name = self.title
		self.attachment_content_type = url.base_uri.path.split('.')[-1]
		self.remote_url = url.base_uri
		rescue # catch url errors with validations instead of exceptions (Errno::ENOENT, OpenURI::HTTPError, etc...)
	end
	
end