class AddFirstNameAndMiddleNameAndFirstSurnameAndSecondSurnameAndGenderAndBioAndAccessLevelToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :middle_name, :string
    add_column :users, :first_surname, :string
    add_column :users, :second_surname, :string
    add_column :users, :gender, :integer
    add_column :users, :bio, :text
    add_column :users, :access_level, :integer, default: 0
  end
end
