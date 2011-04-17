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

ActiveRecord::Schema.define(:version => 20110416154847) do

  create_table "blogs", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "title"
    t.string   "about"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blogs", ["name"], :name => "index_blogs_on_name", :unique => true

  create_table "posts", :force => true do |t|
    t.integer  "blog_id",    :null => false
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["blog_id"], :name => "index_posts_on_blog_id"

end
