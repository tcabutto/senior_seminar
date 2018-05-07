class AddReportedToDeals < ActiveRecord::Migration[5.1]
  def change
    add_column :deals, :reported, :integer
  end
end
