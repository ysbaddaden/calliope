module Calliope
  module Models
    module Post
      extend ActiveSupport::Concern

      included do
        attr_protected :blog_id
        belongs_to :blog
      end

      module ClassMethods
      end
    end
  end
end
