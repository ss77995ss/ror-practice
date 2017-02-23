require 'rails_helper'

RSpec.describe StockController, type: :controller do
  describe 'GET index' do
    before(:all) do
      Stock.destroy_all
    end

    after(:all) do
      Stock.destroy_all
    end

    it 'assigns @stocks' do
      create(:stock, created_at: Date.yesterday)
      stock_today = create(:stock)
      get :index

      expect(assigns[:stocks]).to eq([stock_today])
    end

    it 'render template' do
      get :index

      expect(response).to be_success
      expect(response).to render_template('index')
    end
  end

  describe 'GET search' do
    stock1 = {}, stock2 = {}

    before(:all) do
      Stock.destroy_all

      stock1 = create(:stock, stock_code: '1111')
      stock2 = create(:stock, stock_code: '9999')
    end

    after(:all) do
      Stock.destroy_all
    end

    context 'assigns @stocks correctly with provided date and code' do
      it 'assigns @stocks with date and stock code' do
        get :search, params = { date: Date.today, code: stock1[:stock_code] }

        expect(assigns[:stocks]).to eq([stock1])
      end
    end

    context 'assigns @stocks correctly with provided date' do
      it 'assigns @stocks with date' do
        get :search, params = { date: Date.today, code: '' }

        expect(assigns[:stocks]).to eq([stock1, stock2])
      end
    end

    context 'assigns @stocks correctly with provided code' do
      it 'assigns @stocks correctly with stock code' do
        get :search, params = { date: '', code: stock1[:stock_code] }

        expect(assigns[:stocks]).to eq([stock1])
      end
    end

    context 'assigns @stocks correctly without params' do
      it 'throw a warning and redirect to index page' do
        get :search, params = { date: '', code: '3333' }

        expect(flash[:alert]).to eq("there is no data with date =  and stock code = #{params[:code]}")
        expect(response).to redirect_to stock_url
      end
    end

    it 'render template with provided params' do
      get :search, params = { date: Date.today, code: '1111' }

      expect(response).to render_template('search')
    end
  end
end
