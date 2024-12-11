ActiveAdmin.register Contact do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :email, :message
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :email, :message]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  form do |f|
    f.inputs "Contact Us Details" do
      f.input :name
      f.input :email
      f.input :message
    end
    f.actions
  end
end
