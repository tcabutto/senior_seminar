class CreateBusinesses < ActiveRecord::Migration[5.1]
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :address
      t.string :phone_number
      t.string :logo
      t.string :website_url
      t.integer :status, default: 0
      t.text :description

      t.timestamps
    end
  end
end
