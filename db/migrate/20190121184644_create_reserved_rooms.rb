class CreateReservedRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :reserved_rooms do |t|
      t.references :reservation, foreign_key: true
      t.references :room_type, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
