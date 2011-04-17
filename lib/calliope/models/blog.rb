module Calliope
  module Models
    module Blog
      extend ActiveSupport::Concern

      included do
        attr_protected :name
        has_many :posts
      end

      module ClassMethods
      end
    end
  end
end
