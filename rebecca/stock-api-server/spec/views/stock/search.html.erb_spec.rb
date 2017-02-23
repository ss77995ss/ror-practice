require 'spec_helper'

describe 'stock/search.html.erb', type: :view do
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

    expect(view).to render_template('table')
    expect(rendered).to have_content(stock.rank.to_s)
    expect(rendered).to have_content(stock.stock_code.to_s)
    expect(rendered).to have_content(stock.stock_name.to_s)
    expect(rendered).to have_content(stock.opening_price.to_s)
    expect(rendered).to have_content(stock.highest_price.to_s)
    expect(rendered).to have_content(stock.lowest_price.to_s)
    expect(rendered).to have_content(stock.ytd_closing_price.to_s)
    expect(rendered).to have_content(stock.closing_price.to_s)
    expect(rendered).to have_content(number_with_delimiter(stock.turnover.to_s, delimiter: ','))
    expect(rendered).to have_content(stock.change.to_s)
    expect(rendered).to have_content(stock.change_range.to_s)
  end
end
