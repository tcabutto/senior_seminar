class AddBusinessToComments < ActiveRecord::Migration[5.1]
  def change
    add_reference :comments, :business, index: true

  end
end
