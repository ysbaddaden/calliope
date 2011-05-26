module Calliope
  module Models
    module Blog
      extend ActiveSupport::Concern

      included do
        attr_protected :name
        
        has_many :posts, :dependent => :destroy
        
        validates_presence_of :name
      end

      module ClassMethods
        def create_with_name(name)
          blog = new
          blog.name = name
          blog.save
          blog
        end
      end
    end
  end
end
