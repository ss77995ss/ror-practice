require 'rails_helper'

RSpec.describe 'routing', type: :routing do
  it 'routes get root' do
    expect(get: root_path).to route_to(
      controller: 'stock',
      action: 'index'
    )
  end

  it 'routes get index' do
    expect(get: stock_path).to route_to(
      controller: 'stock',
      action: 'index'
    )
  end

  it 'routes get search' do
    expect(get: search_path).to route_to(
      controller: 'stock',
      action: 'search'
    )
  end
end
