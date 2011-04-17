class Post < ActiveRecord::Base
  include Calliope::Models::Post

  has_many :comments, :as => :commentable, :order => 'created_at ASC'
end
