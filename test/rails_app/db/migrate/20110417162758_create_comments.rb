class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.references :commentable, :polymorphic => true
      t.text       :body
      t.string     :user_name
      t.string     :user_email
      t.string     :user_url
      t.string     :user_ip,    :limit => 15
      t.boolean    :spam,                     :default => false
      t.boolean    :troll,                    :default => false
      t.timestamps
    end
    
    add_index :comments, [:commentable_type, :commentable_id]
  end

  def self.down
    drop_table :comments
  end
end
