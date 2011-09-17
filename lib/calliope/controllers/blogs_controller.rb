module Calliope
  class BlogsController < ApplicationController
    def edit
      @blog = blog
      respond_with(@blog)
    end

    def update
      @blog = blog
      @blog.update_attributes(params[:blog])
      respond_with(@blog, :location => root_blog_url(params[:name]))
    end

    def blog
      @blog ||= Blog.find_by_name(params[:name])
    end
  end
end
