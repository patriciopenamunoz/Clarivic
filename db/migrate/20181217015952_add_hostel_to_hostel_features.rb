class AddHostelToHostelFeatures < ActiveRecord::Migration[5.2]
  def change
    add_reference :hostel_features, :hostel, foreign_key: true
  end
end
