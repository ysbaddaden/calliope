module Calliope
  module Models
    module Post
      extend ActiveSupport::Concern

      included do
        attr_protected :blog_id
        
        belongs_to :blog
        has_many :comments, :as => :commentable
        
        scope :latest, order("created_at DESC")
      end

#      module ClassMethods
#      end
    end
  end
end
