class SetDefaultValueToOccupiedRoomsFromRoomTypes < ActiveRecord::Migration[5.2]
  def change
    change_column :room_types, :occupied_rooms, :integer, default: 0
  end
end
