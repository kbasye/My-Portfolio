class Project < ActiveRecord::Base
  attr_accessible :caption, :description, :title, :tags_attributes
  has_many :tags, :through => :taggings
  has_many :taggings, :as => :taggable
end