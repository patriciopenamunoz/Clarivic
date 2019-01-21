class AddAddressNumberToHostels < ActiveRecord::Migration[5.2]
  def change
    add_column :hostels, :address_number, :integer
  end
end
