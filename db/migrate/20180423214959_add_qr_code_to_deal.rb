class AddQrCodeToDeal < ActiveRecord::Migration[5.1]
  def change
    add_column :deals, :qr_code, :string, unique: true
  end
end
