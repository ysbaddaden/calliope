module ActionDispatch # :nodoc:
  module Routing # :nodoc:
    class Mapper
      def calliope(*blogs)
        options = blogs.extract_options!
        
        _options = { :path => ":name", :only => [:edit, :update] }
        _options[:constraints] = {
          :name => Regexp.new(blogs.map { |b| Regexp.escape(b.to_s) }.join('|'))
        } if blogs.any?
        
        resource :blog, _options do
          resources :posts, :except => :index do
            commentable :commentable => 'post' unless options[:comments] == false
          end
          
          root :to => "posts#index", :via => :get
        end
        
#        match "/:blog/:year/:month/:day/:url_title" => "posts#show",
#          :constraints => options[:constraints], :as => "pretty_blog_post"
      end
    end
  end
end
