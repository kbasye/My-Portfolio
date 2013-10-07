class Tag < ActiveRecord::Base
	attr_accessible :name
	# validates_uniqueness_of :name
	
	has_many :projects, :through => :taggings, :source => :taggable, :source_type => "Project"
	has_many :entries, :through => :taggings, :source => :taggable, :source_type => "Entry"
	has_many :taggings
end
