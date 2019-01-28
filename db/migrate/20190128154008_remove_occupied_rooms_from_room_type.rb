class RemoveOccupiedRoomsFromRoomType < ActiveRecord::Migration[5.2]
  def change
    remove_column :room_types, :occupied_rooms, :integer
  end
end
