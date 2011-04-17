require 'test_helper'

class BlogsControllerTest < ActionController::TestCase
  [:blog, :news].each do |blog|
    test "should get edit for #{blog}" do
      get :edit, :name => blog
      assert_response :ok
    end

    test "should update for #{blog}" do
      put :update, :name => blog, :blog => { :title => "Da Blog" }
      assert_redirected_to blog_posts_url(blog)
    end
  end
end
