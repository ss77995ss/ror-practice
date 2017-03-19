module StockApi
  require 'nokogiri'
  require 'open-uri'

  DATA_NUM = 50

  def crawl_data
    data = []
    doc = Nokogiri::HTML(open('http://stock.wearn.com/qua.asp'))
    doc.css('tr[class*="stockalllistbg"]').first(DATA_NUM).each do |tr|
      td = tr.css('td').map do |t|
        t.text.to_s.gsub(/[[:space:]]/, '')
      end

      stock_data = {
        rank: td[0],
        stock_code: td[1],
        stock_name: td[2],
        opening_price: td[3],
        highest_price: td[4],
        lowest_price: td[5],
        ytd_closing_price: td[6],
        closing_price: td[7],
        turnover: td[8].to_s.gsub(/[^\d]/, '').to_i,
        change: td[9].to_s.gsub(/[▲]/, '+').gsub(/[▼]/, '-'),
        change_range: td[12].to_s.delete('%').to_f
      }

      data << stock_data
    end
    data
  end
end
