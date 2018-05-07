class AddCachedVotesToEvents < ActiveRecord::Migration[5.1]
  def change
    change_table :events do |t|
      t.integer :cached_votes_up, default: 0
    end
  end
end
