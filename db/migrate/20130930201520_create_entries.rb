class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
    	t.text :caption
    	t.datetime :original_created_at
    	t.string :source_name
    	t.string :source_url
    	t.string :title
      t.timestamps
    end
  end
end
