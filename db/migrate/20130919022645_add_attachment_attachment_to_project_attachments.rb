class AddAttachmentAttachmentToProjectAttachments < ActiveRecord::Migration
  def self.up
    change_table :project_attachments do |t|
      t.attachment :attachment
    end
  end

  def self.down
    drop_attached_file :project_attachments, :attachment
  end
end
