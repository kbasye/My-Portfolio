class Entry < ActiveRecord::Base
  attr_accessible :description, :title
  has_many :tags, :as => :taggable
end
