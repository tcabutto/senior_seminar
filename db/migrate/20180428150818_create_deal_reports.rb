class CreateDealReports < ActiveRecord::Migration[5.1]
  def change
    create_table :deal_reports do |t|
      t.text :content
      t.integer :account_id, foreign_key: true
      t.integer :offense
      t.integer :deal_id, foreign_key: true

      t.timestamps
    end
  end
end
