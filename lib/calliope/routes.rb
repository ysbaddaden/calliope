module ActionDispatch # :nodoc:
  module Routing # :nodoc:
    class Mapper
      def calliope(*blogs)
        options = blogs.extract_options!
        
        options[:path] = ":name"
        options[:only] = [:edit, :update]
        
        if blogs.any?
          re = Regexp.new(blogs.collect { |blog| Regexp.escape(blog.to_s) }.join('|'))
          options[:constraints] = { :name => re }
        end
        
        resource :blog, options
        resources :posts, :path => ":blog", :as => 'blog_posts', :constraints => { :blog => re }
        
#        match "/:blog/:year/:month/:day/:url_title" => "posts#show",
#          :constraints => options[:constraints], :as => "pretty_blog_post"
        
#        resources :posts, :path => ':blog', :as => 'blog', :constraints => options[:constraints]
      end
    end
  end
end
