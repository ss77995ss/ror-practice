require 'rails_helper'

RSpec.describe StockHelper, type: :helper do
  describe '#add_class' do
    context 'when change value is a negative number' do
      it 'should return a td with class text-green' do
        result = helper.add_class(-0.01)

        expect(result).to eq %(<td class="text-green">▼0.01</td>)
      end
    end

    context 'when change value is zero' do
      it 'should return a td' do
        result = helper.add_class(0)

        expect(result).to eq %(<td>0</td>)
      end
    end

    context 'when change value is a positive number' do
      it 'should return a td with class text-red' do
        result = helper.add_class(0.01)

        expect(result).to eq %(<td class="text-red">▲0.01</td>)
      end
    end
  end

  describe '#sort_link' do
    it 'should generate sortable links in index page' do
      allow(helper).to receive(:params).and_return(controller: :stock, action: :index)
      result = helper.sort_link(:rank, '排名')

      expect(result).to eq %(<a href="/?direction=desc&amp;sort=rank">排名</a>)
    end

    it 'should generate sortable links in search page' do
      allow(helper).to receive(:params).and_return(controller: :stock, action: :search, date: Date.today, code: 1111)
      result = helper.sort_link(:stock_name, '名稱')

      expect(result).to eq %(<a href="/search?code=1111&amp;date=#{Date.today}&amp;direction=desc&amp;sort=stock_name">名稱</a>)
    end
  end
end
