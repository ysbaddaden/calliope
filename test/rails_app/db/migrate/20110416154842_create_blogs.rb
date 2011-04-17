class CreateBlogs < ActiveRecord::Migration
  def self.up
    create_table :blogs do |t|
      t.string :name, :null => false
      t.string :title
      t.text   :about
      t.timestamps
    end
    
    add_index :blogs, :name, :unique => true
  end

  def self.down
    drop_table :blogs
  end
end
