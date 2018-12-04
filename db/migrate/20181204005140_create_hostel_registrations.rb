class CreateHostelRegistrations < ActiveRecord::Migration[5.2]
  def change
    create_table :hostel_registrations do |t|
      t.references :user, foreign_key: true
      t.references :hostel, foreign_key: true
      t.integer :role

      t.timestamps
    end
  end
end
