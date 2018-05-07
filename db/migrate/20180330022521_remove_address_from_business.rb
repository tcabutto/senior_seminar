class RemoveAddressFromBusiness < ActiveRecord::Migration[5.1]
  def change
    remove_column :businesses, :address, :string
  end
end
