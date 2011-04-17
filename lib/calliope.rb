require 'calliope/config'
require 'calliope/routes'

module Calliope
  autoload :BlogsController, "calliope/controllers/blogs_controller"
  autoload :PostsController, "calliope/controllers/posts_controller"

  module Models
    autoload :Blog, "calliope/models/blog"
    autoload :Post, "calliope/models/post"
  end

  def self.config
    yield Calliope::Config
  end
end
