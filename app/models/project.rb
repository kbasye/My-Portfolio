class Project < ActiveRecord::Base
	attr_accessible :caption, :description, :title

	has_many :tags, :through => :taggings
	has_many :taggings, :as => :taggable
	attr_accessible :tags_attributes, :tags
	accepts_nested_attributes_for :tags
	
	has_many :project_attachments
	attr_accessible :project_attachments_attributes
	accepts_nested_attributes_for :project_attachments, :allow_destroy => true
end