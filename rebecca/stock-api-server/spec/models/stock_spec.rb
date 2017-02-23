require 'rails_helper'

RSpec.describe 'Stock', type: :model do
  describe '.load_data' do
    context 'data is already in db' do
      before(:all) do
        Stock.destroy_all
        create(:stock)
      end

      after(:all) do
        Stock.destroy_all
      end

      it 'should not crwal data and output data is already in db' do
        allow(Stock).to receive(:crawl_data)
        Stock.load_data

        expect(Stock).not_to receive(:crawl_data)
        expect(Stock.count).to eq(1)
      end
    end

    context 'need to load data' do
      before(:all) do
        Stock.destroy_all
      end

      after(:all) do
        Stock.destroy_all
      end

      it 'should load today stocks in db' do
        stock = {
          rank: 1,
          stock_code: 1111,
          stock_name: '友達',
          opening_price: 25.00,
          highest_price: 26.45,
          lowest_price: 25.00,
          ytd_closing_price: 24.05,
          closing_price: 26.45,
          turnover: 73773,
          change: '▲2.40',
          change_range: '9.98%'
        }
        allow(Stock).to receive(:crawl_data) { [stock] }

        Stock.load_data

        expect(Stock).to have_received(:crawl_data).once
        expect(Stock.count).to eq(1)
      end
    end
  end

  describe '.crawl_data' do
    result = []

    before(:all) do
      result = Stock.crawl_data
    end

    it 'should return a hash array' do
      expect(result).not_to be_empty
      expect(result).to be_a(Array)
      expect(result.length).to be(50)
    end

    it 'should have these attributes in hash' do
      result.map do |data|
        expect(data).to have_key(:rank)
        expect(data).to have_key(:stock_code)
        expect(data).to have_key(:stock_name)
        expect(data).to have_key(:opening_price)
        expect(data).to have_key(:highest_price)
        expect(data).to have_key(:lowest_price)
        expect(data).to have_key(:ytd_closing_price)
        expect(data).to have_key(:closing_price)
        expect(data).to have_key(:turnover)
        expect(data).to have_key(:change)
        expect(data).to have_key(:change_range)
      end
    end
  end
end
