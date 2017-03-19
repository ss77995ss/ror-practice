module StockHelper
  def add_class(change)
    if change.to_s.first == '-'
      content_tag(:td, '▼' + change.to_s.delete('-'), class: 'text-green')
    elsif change.zero?
      content_tag(:td, change)
    else
      content_tag(:td, '▲' + change.to_s, class: 'text-red')
    end
  end

  def sort_link(column, title = nil)
    title ||= column
    direction = params[:direction] == 'desc' ? 'asc' : 'desc'
    link_to title, params.merge(sort: column, direction: direction, date: params[:date], code: params[:code])
  end
end
