class AddPersonnelToComments < ActiveRecord::Migration[5.1]
  def change
    add_reference :comments, :personnel, index: true
  end
end
