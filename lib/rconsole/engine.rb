require 'logger'

module Rconsole
  class Engine < ::Rails::Engine
    initializer 'rconsole.middleware' do |app|
      app.middleware.use Rconsole::Middleware

      Rails::Rack::Logger.class_eval do
        def call_with_rconsole(env)
          begin
            key = :'rconsole.old_rails_logger_level'
            
            if env['PATH_INFO'] =~ /\/rconsole\.js(on)?/
              env[key] = Rails.logger.level
              Rails.logger.level = Logger::ERROR
            end
            
            call_without_rconsole env
          ensure
            Rails.logger.level = env[key] if env[key]
          end
        end
        alias_method_chain :call, :rconsole
      end
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