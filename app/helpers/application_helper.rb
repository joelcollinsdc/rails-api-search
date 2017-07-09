module ApplicationHelper
  # http://railscasts.com/episodes/228-sortable-table-columns?view=asciicast
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = (column == sort_column) ? "current #{sort_direction}" : nil
    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}
  end

  def flash_class(level)
    levels = {
      notice: 'alert alert-info',
      success: 'alert alert-success',
      error: 'alert alert-danger',
      alert: 'alert alert-danger'
    }
    levels[level.to_sym]
  end
end
