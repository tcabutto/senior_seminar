class AddAddressToBusinesses < ActiveRecord::Migration[5.1]
  def change
    add_column :businesses, :address1, :string
    add_column :businesses, :address2, :string
    add_column :businesses, :state, :string
    add_column :businesses, :zip, :string
    add_column :businesses, :city, :string
  end
end
