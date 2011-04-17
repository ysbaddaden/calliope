require 'test_helper'

class PostsTest < ActionDispatch::IntegrationTest
  [:blog, :news].each do |blog|
    test "should create #{blog} post" do
      visit new_blog_post_path(blog)
      
      fill_in 'post_title', :with => "some title"
      fill_in 'post_body',  :with => "some body"
      
      assert_difference('Post.count') do
        click_button 'post_submit'
        assert_equal blog_post_path(blog, Post.last), current_path
      end
      
      assert_equal "some title", Post.last.title
      assert_equal "some body",  Post.last.body
    end

    test "should edit #{blog} post" do
      visit edit_blog_post_path(blog, posts(blog))
      
      fill_in 'post_title', :with => "some new title"
      fill_in 'post_body',  :with => "some new body"
      
      assert_no_difference('Post.count') do
        click_button 'post_submit'
        assert_equal blog_post_path(blog, posts(blog)), current_path
      end
      
      posts(blog).reload
      assert_equal "some new title", posts(blog).title
      assert_equal "some new body", posts(blog).body
    end
  end
end
