require 'spec_helper'

describe 'stock/index.html.erb', type: :view do
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

    expect(rendered).to have_css('form')
    expect(rendered).to have_css('input', count: 4)
    expect(rendered).to have_xpath("//input[@value='搜尋']")
    expect(rendered).to have_xpath("//input[@value='save page']")
    expect(view).to render_template('table')
  end
end
