class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.references :hostel_registration, foreign_key: true
      t.date :starting_date
      t.date :ending_date
      t.integer :total
      t.boolean :payed

      t.timestamps
    end
  end
end
