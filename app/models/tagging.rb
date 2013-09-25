class Tagging < ActiveRecord::Base
	attr_accessible :taggable_id, :taggable_type
	belongs_to :tag
	belongs_to :taggable, :polymorphic => true

	def caption
		self.taggable_type.constantize.find(self.taggable_id).caption
	end

	def id
		self.taggable_type.constantize.find(self.taggable_id).id
	end

	def namespace
		"#{taggable_type.downcase}" + 's'
	end

	def tags
		self.taggable_type.constantize.find(self.taggable_id).tags
	end

	def title
		self.taggable_type.constantize.find(self.taggable_id).title
	end

end