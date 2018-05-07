class CreateDeals < ActiveRecord::Migration[5.1]
  def change
    create_table :deals do |t|
      t.string :name
      t.text :description
      t.integer :category
      t.date :start_date
      t.date :end_date
      t.integer :popularity, default: 0

      t.timestamps
    end
  end
end
