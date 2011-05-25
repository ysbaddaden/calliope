require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  [:blog, :news].each do |blog|
    test "should get new for #{blog}" do
      get :new, :commentable => "post", :name => blog, :post_id => posts(blog).to_param
      assert_response :ok
      assert_select "form[action=" + blog_post_comments_path(blog, posts(blog)) + "]"
    end

    test "should create for #{blog}" do
      assert_difference('Comment.count') do
        post :create, :commentable => "post", :name => blog, :post_id => posts(blog).to_param,
          :comment => { :body => "some comment body" }
        assert_redirected_to blog_post_url(blog, posts(blog), :anchor => "C#{assigns(:comment).to_param}")
      end
    end

    test "should get edit for #{blog}" do
      get :edit, :commentable => "post", :name => blog,
        :post_id => posts(blog).to_param, :id => comments("#{blog}_post_1").to_param
      assert_response :ok
      assert_select "form[action=" + blog_post_comment_path(blog, posts(blog), comments("#{blog}_post_1")) + "]"
    end

    test "should update for #{blog}" do
      assert_no_difference('Comment.count') do
        put :update, :commentable => "post", :name => blog,
          :post_id => posts(blog).to_param, :id => comments("#{blog}_post_1").to_param,
          :comment => { :body => "some new comment body" }
        assert_redirected_to blog_post_url(blog, posts(blog), :anchor => "C#{comments("#{blog}_post_1").to_param}")
      end
      
      assert_equal "some new comment body", comments("#{blog}_post_1").reload.body
    end

    test "should destroy for #{blog}" do
      assert_difference('Comment.count', -1) do
        delete :destroy, :commentable => "post", :name => blog,
          :post_id => posts(blog).to_param, :id => comments("#{blog}_post_1").to_param
        assert_redirected_to blog_post_url(blog, posts(blog))
      end
    end
  end
end
