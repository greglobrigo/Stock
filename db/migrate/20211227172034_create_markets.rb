class CreateMarkets < ActiveRecord::Migration[6.1]
  def change
    create_table :markets do |t|
      t.string :ticker
      t.string :name

      t.timestamps
    end
  end
end
