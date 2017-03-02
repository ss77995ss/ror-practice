class TurnoversController < ApplicationController
  def index
    @turnovers =
      if !params[:date].blank? && !params[:number].blank?
        Turnover.where('number like ? and date = ?', "%#{params[:number]}%", params[:date]).order('volumn DESC')
      elsif !params[:date].blank?
        Turnover.where(date: params[:date]).order('volumn DESC')
      elsif !params[:number].blank?
        Turnover.where('number like ?', "%#{params[:number]}%").order('volumn DESC')
      else
        Turnover.where(date: Time.new.in_time_zone.to_date.to_s).order('volumn DESC')
      end
  end
end
