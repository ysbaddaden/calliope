module Calliope
  class PostsController < ApplicationController
    helper_method :current_blog

    def index
      @posts = current_blog.posts.latest
      respond_with(@posts)
    end

    def show
      @post = current_blog.posts.find(params[:id])
      respond_with(@post)
    end

    def new
      @post = current_blog.posts.build
      respond_with(@post)
    end

    def edit
      @post = current_blog.posts.find(params[:id])
    end

    def create
      @post = current_blog.posts.build(params[:post])
      @post.save
      respond_with(@post, :location => blog_post_url(current_blog.name, @post))
    end

    def update
      @post = current_blog.posts.find(params[:id])
      @post.update_attributes(params[:post])
      respond_with(@post, :location => blog_post_url(current_blog.name, @post))
    end

    def destroy
      @post = current_blog.posts.find(params[:id])
      @post.destroy
      respond_with(@post, :location => root_blog_url(current_blog.name))
    end

    def current_blog
      unless @current_blog
        @current_blog = Blog.find_by_name(params[:name])
        raise ActiveRecord::RecordNotFound.new("Couldn't find blog with name #{params[:name]}") unless @current_blog
      end
      
      @current_blog
    end
  end
end
