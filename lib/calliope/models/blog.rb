module Calliope
  module Models
    module Blog
      extend ActiveSupport::Concern

      included do
        attr_protected :name
        
        has_many :posts
        
        validates_presence_of :name
      end

#      module ClassMethods
#      end
    end
  end
end
