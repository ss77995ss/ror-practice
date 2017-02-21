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
end
