module Rconsole
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      @app.call env
    rescue Exception => e
      Rconsole::Base.instance.dump
      raise e
    end
  end
end