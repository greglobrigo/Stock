class AddQuantityToStocksTable < ActiveRecord::Migration[6.1]
  def change
    add_column :stocks, :quantity, :integer, default: 0
  end
end
