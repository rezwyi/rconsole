class RconsoleController < ActionController::Base
  respond_to :json

  def dump
    respond_with rconsole.dump
  end
end
