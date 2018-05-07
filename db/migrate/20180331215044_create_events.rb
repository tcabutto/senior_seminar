class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.datetime :start
      t.datetime :end
      t.string :name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.text :description
      t.string :website_url
      t.integer :rsvp, default: 0
      t.string :image_url
      t.string :location

      t.timestamps
    end
  end
end
