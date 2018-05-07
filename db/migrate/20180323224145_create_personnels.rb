class CreatePersonnels < ActiveRecord::Migration[5.1]
  def change
    create_table :personnels do |t|
      t.string :username
      t.integer :rank
      t.integer :branch
      t.string :member
      t.string :image_url

      t.timestamps
    end
  end
end
