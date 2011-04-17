require 'test_helper'

class BlogsTest < ActionDispatch::IntegrationTest
  [:blog, :news].each do |blog|
    test "should update #{blog}" do
      visit edit_blog_path(blog)
      
      fill_in 'blog_title', :with => "some new title"
      fill_in 'blog_about', :with => "some new about"
      click_button 'blog_submit'
      
      assert_equal blog_posts_path(blog), current_path
      assert_equal "some new title", blogs(blog).title
      assert_equal "some new about", blogs(blog).about
    end
  end
end
