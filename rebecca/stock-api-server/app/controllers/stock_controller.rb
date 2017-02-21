class StockController < ApplicationController
  def index
    @stocks = Stock
              .where('date(created_at) = ?', Date.today)
  end
end
