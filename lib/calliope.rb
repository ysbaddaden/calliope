require "calliope/config"
require "calliope/routes"

autoload :Comment, "calliope/models/comment"

module Calliope
  autoload :BlogsController,    "calliope/controllers/blogs_controller"
  autoload :PostsController,    "calliope/controllers/posts_controller"
  autoload :CommentsController, "calliope/controllers/comments_controller"

  module Models
    autoload :Blog, "calliope/models/blog"
    autoload :Post, "calliope/models/post"
  end

  def self.config
    yield Calliope::Config
  end
end
