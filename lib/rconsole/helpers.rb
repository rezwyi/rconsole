module Rconsole
  module Helpers
    def self.included(base)
      base.send :include, InstanceMethods
    end

    module InstanceMethods
      def rconsole
        Base.instance
      end
    end
  end
end
