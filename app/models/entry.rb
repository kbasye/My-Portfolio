class Entry < ActiveRecord::Base
	attr_accessible :caption, :original_created_at, :source_name, :source_url, :title

	has_many :tags, :through => :taggings
	has_many :taggings, :as => :taggable
	attr_accessible :tags_attributes, :tags
	accepts_nested_attributes_for :tags

	has_many :project_attachments
	attr_accessible :project_attachments_attributes
	accepts_nested_attributes_for :project_attachments, :allow_destroy => true


	private

	def self.goodreads
		client = Goodreads.new(Goodreads.configuration)
		client.shelf(21730105, 'currently-reading')[:books].each do |entity|
			unless Entry.exists?(:title => entity.book.title)
				entry = Entry.create(
					:original_created_at => entity.started_at.to_datetime,
					:source_name => 'Goodreads', 
					:source_url => 'http://www.goodreads.com/review/list/21730105?shelf=currently-reading',
					:title =>entity.book.title
					)
				entry.tags << Tag.find_or_create_by_name('reading')
				entry.project_attachments << ProjectAttachment.create(
					:caption => "Cover of " + entity.book.title,
					:attachment_file_name => entity.book.title,
					:remote_url => entity.book.image_url
					)
			end
		end
	end

end
