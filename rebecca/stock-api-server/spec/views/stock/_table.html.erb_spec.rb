require 'spec_helper'

describe 'stock/_table.html.erb', type: :view do
  stock = {}
  STOCK_NUM = 50

  before(:all) do
    Stock.destroy_all
    stock = create_list(:stock, STOCK_NUM)
  end

  after(:all) do
    Stock.destroy_all
  end

  it 'should render correctly' do
    assign(:stocks, stock)
    render

    expect(rendered).to have_css('table')
    expect(rendered).to have_css('tr', count: STOCK_NUM + 1)
    expect(rendered).to have_css('th', count: 11)
  end

  it 'should have css' do
    assign(:stocks, stock)
    render

    expect(rendered).to have_css('table.table')
    expect(rendered).to have_css('th.text-center')
    expect(rendered).to have_css('td.text-center', count: STOCK_NUM)
  end

  it 'should render table header correctly' do
    assign(:stocks, stock)
    render

    expect(rendered).to have_link('排名')
    expect(rendered).to have_link('代號')
    expect(rendered).to have_link('名稱')
    expect(rendered).to have_link('開盤價')
    expect(rendered).to have_link('最高價')
    expect(rendered).to have_link('最低價')
    expect(rendered).to have_link('昨收盤')
    expect(rendered).to have_link('今收盤')
    expect(rendered).to have_link('成交量')
    expect(rendered).to have_link('漲跌')
    expect(rendered).to have_link('漲跌幅')
  end

  it 'should render data correctly' do
    assign(:stocks, stock)
    render

    expect(rendered).to have_css('table tr td', text: 1, count: STOCK_NUM)
    expect(rendered).to have_css('table tr td', text: '9999', count: STOCK_NUM)
    expect(rendered).to have_css('table tr td', text: 25.0, count: STOCK_NUM * 2)
    expect(rendered).to have_css('table tr td', text: 26.45, count: STOCK_NUM * 2)
    expect(rendered).to have_css('table tr td', text: 24.05, count: STOCK_NUM)
    expect(rendered).to have_css('table tr td', text: '73,773', count: STOCK_NUM)
    expect(rendered).to have_css('table tr td', text: '▲2.4', count: STOCK_NUM)
    expect(rendered).to have_css('table tr td', text: '9.98%', count: STOCK_NUM)
  end
end
