module ApplicationHelper
  def div_hidden(id, value)
    content_tag :div, value, id: id, hidden: 'hidden'
  end
end
