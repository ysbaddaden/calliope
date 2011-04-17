require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  [:blog, :news].each do |blog|
    test "should get index for #{blog}" do
      get :index, :name => blog
      assert_response :ok
      assert_select 'article.post', blogs(blog).posts.count
      assert_select 'article.post h2', blogs(blog).posts.first.title
    end

    test "should get show for #{blog}" do
      get :show, :name => blog, :id => posts(blog).to_param
      assert_response :ok
      assert_select '#post', 1
      assert_select '#post h1', posts(blog).title
      assert_select '#post form.new_comment', 1
      assert_select "form[action=" + blog_post_comments_path(blogs(blog).name, posts(blog)) + "]", 1
    end

    test "should get new for #{blog}" do
      get :new, :name => blog
      assert_response :ok
      assert_select "form[action=" + blog_posts_path(blog) + "]", 1
    end

    test "should get edit for #{blog}" do
      get :edit, :name => blog, :id => posts(blog).to_param
      assert_response :ok
      assert_select "form[action=" + blog_post_path(blog, posts(blog)) + "]", 1
    end

    test "should create for #{blog}" do
      assert_difference 'Post.count' do
        post :create, :name => blog, :post => { :title => "some title" }
        assert_redirected_to blog_post_url(blog, assigns(:post))
      end
      
      assert_equal "some title", assigns(:post).title
    end

    test "should update for #{blog}" do
      assert_no_difference 'Post.count' do
        put :update, :name => blog, :id => posts(blog).to_param, :post => { :title => "bla bla" }
        assert_redirected_to blog_post_url(blog, posts(blog))
      end
        
      assert_equal "bla bla", posts(blog).reload.title
    end

    test "should destroy for #{blog}" do
      assert_difference 'Post.count', -1 do
        delete :destroy, :name => blog, :id => posts(blog).to_param
        assert_redirected_to root_blog_url(blog)
      end
    end
  end
end
