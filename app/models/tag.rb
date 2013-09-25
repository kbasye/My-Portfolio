class Tag < ActiveRecord::Base
	attr_accessible :name
	has_many :projects, :through => :taggings, :source => :taggable, :source_type => "Project"
	has_many :taggings
end
