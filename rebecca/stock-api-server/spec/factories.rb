FactoryGirl.define do
  factory :stock do
    rank 1
    stock_code '9999'
    stock_name 'Datong'
    opening_price 25.00
    highest_price 26.45
    lowest_price 25.00
    ytd_closing_price 24.05
    closing_price 26.45
    turnover 73773
    change '2.40'
    change_range '9.98'
  end
end
