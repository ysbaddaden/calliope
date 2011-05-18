class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.references :blog, :null => false
      t.string     :title
      t.text       :body
      t.integer    :comments_count
      t.timestamps
    end
    
    add_index :posts, :blog_id
  end

  def self.down
    drop_table :posts
  end
end
