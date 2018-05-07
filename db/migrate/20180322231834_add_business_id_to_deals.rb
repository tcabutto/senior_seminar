class AddBusinessIdToDeals < ActiveRecord::Migration[5.1]
  def change
    add_reference :deals, :business, foreign_key: true
  end
end
