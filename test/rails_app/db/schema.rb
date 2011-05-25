# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110417162758) do

  create_table "blogs", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "title"
    t.text     "about"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blogs", ["name"], :name => "index_blogs_on_name", :unique => true

  create_table "comments", :force => true do |t|
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.text     "body"
    t.string   "user_name"
    t.string   "user_email"
    t.string   "user_url"
    t.string   "user_ip",          :limit => 15
    t.boolean  "spam",                           :default => false
    t.boolean  "troll",                          :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_type", "commentable_id"], :name => "index_comments_on_commentable_type_and_commentable_id"

  create_table "posts", :force => true do |t|
    t.integer  "blog_id",        :null => false
    t.string   "title"
    t.text     "body"
    t.integer  "comments_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["blog_id"], :name => "index_posts_on_blog_id"

end
