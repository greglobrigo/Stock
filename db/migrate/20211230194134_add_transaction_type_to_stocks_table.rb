class AddTransactionTypeToStocksTable < ActiveRecord::Migration[6.1]
  def change
    add_column :stocks, :transaction_type, :string
  end
end
