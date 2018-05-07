class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.integer :popularity_given
      t.date :transaction_date

      t.timestamps
    end
  end
end
