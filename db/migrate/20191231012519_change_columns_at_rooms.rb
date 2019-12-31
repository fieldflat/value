class ChangeColumnsAtRooms < ActiveRecord::Migration[5.2]
  def change
    remove_column :rooms, :used
    add_column :rooms, :used, :boolean, default: false
  end
end
