require 'test_helper'

class RoutesTest < ActionController::TestCase
  test "blog" do
    assert_routing "/blog/edit", :controller => "blogs", :action => "edit", :name => "blog"
    assert_routing({ :method => :put, :path => "/blog" }, :controller => "blogs", :action => "update", :name => "blog")
  end

  test "news" do
    assert_routing "/news/edit", :controller => "blogs", :action => "edit", :name => "news"
    assert_routing({ :method => :put, :path => "/news" }, :controller => "blogs", :action => "update", :name => "news")
  end

  test "unknown blog" do
    assert_raise ActionController::RoutingError do
      assert_routing "/blag/edit", :controller => "blogs", :action => "edit", :name => "blag"
    end

    assert_raise ActionController::RoutingError do
      assert_routing({ :method => :put, :path => "/blag" }, :controller => "blogs", :action => "update", :name => "blag")
    end
  end

  test "blog posts" do
    assert_routing "/blog", :controller => "posts", :action => "index", :name => "blog"
    assert_routing "/blog/posts/43", :controller => "posts", :action => "show",  :name => "blog", :id => "43"
    
    assert_routing "/blog/posts/new", :controller => "posts", :action => "new",  :name => "blog"
    assert_routing "/blog/posts/1/edit", :controller => "posts", :action => "edit", :name => "blog", :id => "1"
    
    assert_routing({ :method => :post, :path => "/blog/posts" },
      :controller => "posts", :action => "create", :name => "blog")
    
    assert_routing({ :method => :put, :path => "/blog/posts/2" },
      :controller => "posts", :action => "update", :name => "blog", :id => "2")
    
    assert_routing({ :method => :delete, :path => "/blog/posts/3" },
      :controller => "posts", :action => "destroy", :name => "blog", :id => "3")
  end
end
