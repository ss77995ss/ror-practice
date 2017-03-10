require 'spec_helper'

describe 'stock/index.html.slim', type: :view do
  stock = {}

  before(:all) do
    Stock.destroy_all
    stock = create(:stock)
  end

  after(:all) do
    Stock.destroy_all
  end

  it 'should render correctly' do
    assign(:stocks, [stock])
    render

    expect(rendered).to have_css('search-form')
    expect(rendered).to have_css('div.set-right')
    expect(rendered).to have_css('button')
    expect(rendered).to have_link('儲存檔案', href: stock_url(format: :csv))
    expect(rendered).to have_css('stock-table')
  end

  it 'should pass parameters correctly' do
    assign(:stocks, [stock])
    render

    expect(rendered).to have_selector('stock-table[contains(@sortType, "vm.sortType")]')
    expect(rendered).to have_selector('stock-table[contains(@sortReverse, "vm.sortReverse")]')
    expect(rendered).to include(stock.rank.to_s)
    expect(rendered).to include(stock.stock_code.to_s)
    expect(rendered).to include(stock.stock_name.to_s)
    expect(rendered).to include(stock.opening_price.to_s)
    expect(rendered).to include(stock.highest_price.to_s)
    expect(rendered).to include(stock.lowest_price.to_s)
    expect(rendered).to include(stock.ytd_closing_price.to_s)
    expect(rendered).to include(stock.closing_price.to_s)
    expect(rendered).to include(stock.turnover.to_s)
    expect(rendered).to include(stock.change.to_s)
    expect(rendered).to include(stock.change_range.to_s)
  end
end
