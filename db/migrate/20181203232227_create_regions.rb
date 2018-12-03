class CreateRegions < ActiveRecord::Migration[5.2]
  def change
    create_table :regions do |t|
      t.string :short_name
      t.string :full_name
      t.text :desciption

      t.timestamps
    end
  end
end
