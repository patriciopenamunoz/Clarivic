class RemoveUserFromHostels < ActiveRecord::Migration[5.2]
  def change
    remove_reference :hostels, :user, foreign_key: true
  end
end
