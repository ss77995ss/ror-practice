class TurnoversController < ApplicationController
  def index
    @turnovers =
      if params[:date] && params[:number]
        Turnover.where(number: params[:number], date: params[:date])
      elsif params[:date]
        Turnover.where(date: params[:date])
      elsif params[:number]
        Turnover.where(number: params[:number])
        # Turnover.where(['number like ?', '%#{params[:number]}%'])
      else
        Turnover.where(date: Time.new.in_time_zone.to_date.to_s)
      end
  end
end
