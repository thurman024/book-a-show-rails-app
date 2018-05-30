class AddVenueIdToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :venue_id, :integer
  end
end
