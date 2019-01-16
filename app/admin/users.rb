ActiveAdmin.register User do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  permit_params :first_name, :middle_name, :first_surname, :second_surname,
                :gender, :bio, :access_level, :email, :password

  index do
    column :id
    column :email
    column :created_at
    column :hostel_count { |user| user.hostels.length }

    actions
  end

  form do |f|
    inputs 'Agregando nuevo usuario' do
      input :first_name
      input :middle_name
      input :first_surname
      input :second_surname
      input :gender
      input :bio
      input :access_level
      input :email
      input :password
    end

    actions
  end

controller do
  def update
    user = params[:user]
    if (user[:password].blank? && user[:password_confirmation].blank?)
      params[:user].delete('password')
      params[:user].delete('password_confirmation')
    end
    super
  end
end

filter :id
filter :email
filter :created_at

end
