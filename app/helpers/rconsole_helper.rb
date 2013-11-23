module RconsoleHelper
  def javascript_include_rconsole_tag
    javascript_include_tag(:rconsole) if Rails.env.development?
  end
end
