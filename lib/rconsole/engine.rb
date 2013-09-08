module Rconsole
  class Engine < ::Rails::Engine
    initializer 'rconsole.middleware' do |app|
      app.middleware.use Rconsole::Middleware
    end
    
    initializer 'rconsole.include_helpers' do
      ActiveSupport.on_load :action_controller do
        ActionController::Base.send :include, Rconsole::Helpers
      end

      ActiveSupport.on_load :active_record do
        ActiveRecord::Base.send :include, Rconsole::Helpers
      end

      ActiveSupport.on_load :action_view do
        ActionView::Base.send :include, Rconsole::Helpers
      end
    end
  end
end
