ActiveAdmin.register Order do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :order_item_id, :customer_id, :total_price
  #
  # or
  #
  # permit_params do
  #   permitted = [:order_item_id, :customer_id, :total_price]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  form do |f|
    f.semantic_errors

    f.inputs "Order Details" do
      f.input :order_item_id,
              as: :select,
              collection: OrderItem.joins(:product).pluck("products.model, order_items.id"),
              include_blank: false,
              label: "Product"

      f.input :customer_id, as: :select, collection: Customer.pluck(:name, :id), include_blank: false, label: "Customer"
      f.input :total_price
    end

    f.actions
  end
end
