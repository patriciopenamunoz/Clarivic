class ChangeValueByNightColumnNameFromRoomTypes < ActiveRecord::Migration[5.2]
  def change
    rename_column :room_types, :value_by_night, :value_per_night
  end
end
