class Project < ActiveRecord::Base
	attr_accessible :caption, :description, :title

	attr_accessible :tags_attributes
	has_many :tags, :through => :taggings
	has_many :taggings, :as => :taggable
	
	has_many :project_attachments
end