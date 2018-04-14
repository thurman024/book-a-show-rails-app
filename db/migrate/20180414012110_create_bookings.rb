class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.integer :band_id
      t.integer :venue_id
      t.datetime :showtime
      t.timestamps
    end
  end
end
