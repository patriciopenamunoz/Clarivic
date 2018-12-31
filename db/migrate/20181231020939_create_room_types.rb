class CreateRoomTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :room_types do |t|
      t.string :name
      t.text :description
      t.integer :number_rooms
      t.integer :occupied_rooms
      t.decimal :value_by_night
      t.references :hostel, foreign_key: true

      t.timestamps
    end
  end
end
