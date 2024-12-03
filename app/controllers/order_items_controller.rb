class OrderItemsController < InheritedResources::Base

  private

    def order_item_params
      params.require(:order_item).permit(:product_id, :quantity, :price_at_purchase, :subtotal)
    end

end
