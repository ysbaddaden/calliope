module Calliope
  class BlogsController < ApplicationController
    def edit
      @blog = Blog.find_by_name(params[:name])
      respond_with(@blog)
    end

    def update
      @blog = Blog.find_by_name(params[:name])
      @blog.update_attributes(params[:blog])
      respond_with(@blog, :location => root_blog_url(params[:name]))
    end
  end
end
