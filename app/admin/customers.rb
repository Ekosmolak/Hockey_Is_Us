ActiveAdmin.register Customer do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :address, :postal_code, :phone_number, :email, :password, :password_confirmation
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :address, :postal_code, :phone_number, :email]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form do |f|
    f.inputs "Customer Details" do
      f.input :name
      f.input :address
      f.input :postal_code
      f.input :email
      f.input :phone_number
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
