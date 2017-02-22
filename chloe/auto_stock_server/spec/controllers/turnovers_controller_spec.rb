require 'rails_helper'
require_relative '../../API/crawler.rb'

RSpec.describe TurnoversController, type: :controller do
  describe 'GET #index' do
    context 'when query data default' do
      before(:each) do
        # allow(Turnover).to receive(:insert_to_db).and_return(FactoryGirl.build_list(:turnover, Crawler::DATA_COUNT))
        get :index
      end

      it 'should respond successfully with an HTTP 200 status code' do
        expect(response).to have_http_status(200)
      end

      it 'should render the index template' do
        expect(response).to render_template('index')
      end
    end

    context 'when query data of specified stock number and date' do
      before(:each) do
        # allow(Turnover).to receive(:insert_to_db).and_return(FactoryGirl.build_list(:turnover, Crawler::DATA_COUNT))
        get :index, params: { number: 2330, date: '2017-02-17' }
      end

      it 'should respond successfully with an HTTP 200 status code' do
        expect(response).to have_http_status(200)
      end

      it 'should render the index template' do
        expect(response).to render_template('index')
      end
    end

    context 'when query data of specified date' do
      before(:each) do
        # allow(Turnover).to receive(:insert_to_db).and_return(FactoryGirl.build_list(:turnover, Crawler::DATA_COUNT))
        get :index, params: { date: '2017-02-17' }
      end

      it 'should respond successfully with an HTTP 200 status code' do
        expect(response).to have_http_status(200)
      end

      it 'should render the index template' do
        expect(response).to render_template('index')
      end
    end

    context 'when query data of specified stock number over the years' do
      before(:each) do
        # allow(Turnover).to receive(:insert_to_db).and_return(FactoryGirl.build_list(:turnover, Crawler::DATA_COUNT))
        get :index, params: { number: 2330 }
      end

      it 'should respond successfully with an HTTP 200 status code' do
        expect(response).to have_http_status(200)
      end

      it 'should render the index template' do
        expect(response).to render_template('index')
      end
    end
  end
end
