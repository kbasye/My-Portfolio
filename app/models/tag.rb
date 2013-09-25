class Tag < ActiveRecord::Base
	attr_accessible :name
	has_many :projects, :through => :taggings, :source => :taggable, :source_type => "Project"
	has_many :taggings

	private
	def self.create_tags(model, params)
		params[model.class.name.downcase][:tags][:name].split(', ').each do |name|
			tag = Tag.find_or_create_by_name(:name => name)
			model.tags << tag
		end
	end
end
