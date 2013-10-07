class CreateProjectAttachments < ActiveRecord::Migration
  def change
    create_table :project_attachments do |t|
    	t.text :caption
    	t.string :remote_url
    	t.string :title
    	t.references :entry
    	t.references :project
      t.timestamps
    end
  end
end