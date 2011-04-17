# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{calliope}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Julien Portalier"]
  s.date = %q{2011-04-17}
  s.description = %q{Blog engine for Ruby on Rails.}
  s.email = %q{ysbaddaden@gmail.com}
  s.files = [
    "lib/calliope.rb",
    "lib/calliope/config.rb",
    "lib/calliope/controllers/blogs_controller.rb",
    "lib/calliope/controllers/posts_controller.rb",
    "lib/calliope/models/blog.rb",
    "lib/calliope/models/post.rb",
    "lib/calliope/routes.rb"
  ]
  s.homepage = %q{http://github.com/ysbaddaden/calliope}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{Blog engine for Ruby on Rails.}
  s.test_files = [
    "test/functional/blogs_controller_test.rb",
    "test/functional/posts_controller_test.rb",
    "test/functional/routes_test.rb",
    "test/integration/blogs_test.rb",
    "test/integration/posts_test.rb",
    "test/rails_app/app/controllers/application_controller.rb",
    "test/rails_app/app/controllers/blogs_controller.rb",
    "test/rails_app/app/controllers/home_controller.rb",
    "test/rails_app/app/controllers/posts_controller.rb",
    "test/rails_app/app/helpers/application_helper.rb",
    "test/rails_app/app/models/blog.rb",
    "test/rails_app/app/models/post.rb",
    "test/rails_app/config/application.rb",
    "test/rails_app/config/boot.rb",
    "test/rails_app/config/environment.rb",
    "test/rails_app/config/environments/development.rb",
    "test/rails_app/config/environments/production.rb",
    "test/rails_app/config/environments/test.rb",
    "test/rails_app/config/initializers/calliope.rb",
    "test/rails_app/config/initializers/secret_token.rb",
    "test/rails_app/config/initializers/session_store.rb",
    "test/rails_app/config/routes.rb",
    "test/rails_app/db/migrate/20110416154842_create_blogs.rb",
    "test/rails_app/db/migrate/20110416154847_create_posts.rb",
    "test/rails_app/db/schema.rb",
    "test/rails_app/db/seeds.rb",
    "test/test_helper.rb"
  ]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, ["~> 3.0.6"])
    else
      s.add_dependency(%q<rails>, ["~> 3.0.6"])
    end
  else
    s.add_dependency(%q<rails>, ["~> 3.0.6"])
  end
end

