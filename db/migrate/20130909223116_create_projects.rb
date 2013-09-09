class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
    	t.text :caption
    	t.text :description
    	t.string :title
      t.timestamps
    end
  end
end
