class CreateCommunes < ActiveRecord::Migration[5.2]
  def change
    create_table :communes do |t|
      t.string :short_name
      t.string :full_name
      t.text :description
      t.references :region, foreign_key: true

      t.timestamps
    end
  end
end
