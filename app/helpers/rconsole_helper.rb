# Helper for the Controller
module RconsoleHelper
  def javascript_include_rconsole
    javascript_include_tag(:rconsole) if Rails.env.development?
  end
end
