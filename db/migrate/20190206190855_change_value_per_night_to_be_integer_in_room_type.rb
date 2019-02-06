class ChangeValuePerNightToBeIntegerInRoomType < ActiveRecord::Migration[5.2]
  def change
    change_column :room_types, :value_per_night, :integer
  end
end
