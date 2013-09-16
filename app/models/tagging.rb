class Tagging < ActiveRecord::Base
  attr_accessible :taggable_id, :taggable_type
  belongs_to :tag
  belongs_to :taggable, :polymorphic => true
end