class StockController < ApplicationController
  def index
    @stocks = Stock
              .where("created_at > ? and created_at <= ?", Time.now.beginning_of_day, Time.now.end_of_day)
              .order("#{params[:sort]} #{params[:direction]}")

    respond_to do |format|
      format.html
      format.json { render json: @stocks.to_json }
      format.csv { send_data @stocks.to_csv }
    end
  end

  def search
    date = Date.parse(params[:date]) unless params[:date].empty?
    code = params[:code]
    operator = !params[:date].empty? && !params[:code].empty? ? 'AND' : 'OR'

    @stocks = Stock
              .where("(date(created_at) = ? #{operator} stock_code = ?)", date, code)
              .order("#{params[:sort]} #{params[:direction]}")

    if @stocks.empty?
      flash[:alert] = "there is no data with date = #{date} and stock code = #{code}"
      redirect_to root_url
    else
      respond_to do |format|
        format.html
        format.json { render json: @stocks.to_json }
        format.csv { send_data @stocks.to_csv }
      end
    end
  end
end
