class AddUserIdToVenue < ActiveRecord::Migration[5.1]
  def change
    add_column :venues, :user_id, :integer
  end
end
