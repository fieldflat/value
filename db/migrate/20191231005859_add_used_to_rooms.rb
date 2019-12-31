class AddUsedToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :used, :boolean
  end
end
