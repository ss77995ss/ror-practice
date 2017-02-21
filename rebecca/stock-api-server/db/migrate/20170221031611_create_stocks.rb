class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.integer :rank
      t.string :stock_code
      t.text :stock_name
      t.float :opening_price
      t.float :highest_price
      t.float :lowest_price
      t.float :ytd_closing_price
      t.float :closing_price
      t.integer :turnover
      t.float :change
      t.float :change_range

      t.timestamps
    end
  end
end
