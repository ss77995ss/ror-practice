require 'rails_helper'
require_relative '../../../API/crawler.rb'

RSpec.describe 'turnovers/index.html.erb', type: :view do
  describe 'search block' do
    before(:each) do
      @turnovers = FactoryGirl.build_list(:turnover, 2)
      assign(:turnovers, @turnovers)
      render
    end

    it 'should have stock number and date item' do
      expect(response).to have_css("form[action='/turnovers'][method=get]")
      expect(response).to have_css('form label', text: '搜尋代號 ：', class: 'numberLabel')
      expect(response).to have_field('number', type: 'number', with: '', id: 'number', class: 'numberInput', minimum: 0)
      # expect(response).to have_css('form input[name=number][type=number]', text: '', id: 'number', class: 'numberInput', minimum: 0)
      expect(response).to have_css('form label', text: '搜尋日期 ：', class: 'dateLabel')
      expect(response).to have_field('date', type: 'text', with: Time.new.in_time_zone.to_date.to_s, id: 'date', class: 'dateInput')
      expect(response).to have_css('form input[type=submit][value=search][name=commit]', class: 'searchBtn')
    end
  end

  describe 'table' do
    before(:each) do
      @turnovers = FactoryGirl.build_list(:turnover, Crawler::DATA_COUNT)
      assign(:turnovers, @turnovers)
      render
    end

    it 'should exist' do
      expect(response).to have_css('table', class: 'table table-bordered table-striped table-hover')
    end

    it 'header should have these items' do
      expect(response).to have_css('th', count: 11)
      expect(response).to have_css('table thead th', text: '排', class: 'id text-center')
      expect(response).to have_css('table thead th.id i', class: 'fa fa-caret-down')
      expect(response).to have_css('table thead th', text: '代號', class: 'number text-center')
      expect(response).to have_css('table thead th.number i', class: 'fa fa-caret-down')
      expect(response).to have_css('table thead th', text: '名稱', class: 'name text-center')
      expect(response).to have_css('table thead th.name i', class: 'fa fa-caret-down')
      expect(response).to have_css('table thead th', text: '開盤價', class: 'opening_price text-center')
      expect(response).to have_css('table thead th.opening_price i', class: 'fa fa-caret-down')
      expect(response).to have_css('table thead th', text: '最高價', class: 'highest_price text-center')
      expect(response).to have_css('table thead th.highest_price i', class: 'fa fa-caret-down')
      expect(response).to have_css('table thead th', text: '最低價', class: 'lowest_price text-center')
      expect(response).to have_css('table thead th.lowest_price i', class: 'fa fa-caret-down')
      expect(response).to have_css('table thead th', text: '昨收盤', class: 'closing_yesterday text-center')
      expect(response).to have_css('table thead th.closing_yesterday i', class: 'fa fa-caret-down')
      expect(response).to have_css('table thead th', text: '今收盤', class: 'closing_today text-center')
      expect(response).to have_css('table thead th.closing_today i', class: 'fa fa-caret-down')
      expect(response).to have_css('table thead th', text: '成交量', class: 'volumn text-center')
      expect(response).to have_css('table thead th.volumn i', class: 'fa fa-caret-down')
      expect(response).to have_css('table thead th', text: '漲跌', class: 'change text-center')
      expect(response).to have_css('table thead th.change i', class: 'fa fa-caret-down')
      expect(response).to have_css('table thead th', text: '漲跌幅', class: 'quote_change text-center')
      expect(response).to have_css('table thead th.quote_change i', class: 'fa fa-caret-down')
    end

    it 'body should correctly display daily top 50 turnover' do
      expect(response).to have_css('td', count: 11 * Crawler::DATA_COUNT)
      @turnovers.each_with_index do |turnover, index|
        expect(response).to have_css('table tbody td', text: index + 1, class: 'id text-center')
        expect(response).to have_css('table tbody td', text: turnover[:number], class: 'number text-center')
        expect(response).to have_css('table tbody td', text: turnover[:name], class: 'name text-center')
        expect(rendered).to have_link(turnover[:name], href: turnover[:hyper_link])
        expect(response).to have_css('table tbody td', text: turnover[:opening_price], class: 'opening_price text-center')
        expect(response).to have_css('table tbody td', text: turnover[:highest_price], class: 'highest_price text-center')
        expect(response).to have_css('table tbody td', text: turnover[:lowest_price], class: 'lowest_price text-center')
        expect(response).to have_css('table tbody td', text: turnover[:closing_yesterday], class: 'closing_yesterday text-center')
        expect(response).to have_css('table tbody td', text: turnover[:closing_today], class: 'closing_today text-center')
        expect(response).to have_css('table tbody td', text: turnover[:volumn], class: 'volumn blue text-center')
        if turnover[:change].split('')[0] == '-'
          expect(response).to have_css('table tbody td', text: '▼' + turnover[:change], class: 'change down text-center')
        elsif turnover[:change].to_f == 0
          expect(response).to have_css('table tbody td', text: turnover[:change], class: 'change text-center')
        else
          expect(response).to have_css('table tbody td', text: '▲' + turnover[:change], class: 'change up text-center')
        end
        expect(response).to have_css('table tbody td', text: turnover[:quote_change], class: 'quote_change text-center')
      end
    end
  end
end
