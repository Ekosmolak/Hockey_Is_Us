ActiveAdmin.register OrderItem do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :product_id, :quantity, :price_at_purchase, :subtotal
  #
  # or
  #
  # permit_params do
  #   permitted = [:product_id, :quantity, :price_at_purchase, :subtotal]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  form do |f|
    f.semantic_errors

    f.inputs "Order Item Details" do
      f.input :product, as: :select, collection: Product.pluck(:model, :id), include_blank: false, label: "Product"
      f.input :quantity
      f.input :price_at_purchase
      f.input :subtotal
    end
    f.actions
  end
end
