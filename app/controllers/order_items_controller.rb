class OrderItemsController < InheritedResources::Base
  private

    def order_item_params
      params.require(:order_item).permit(:quantity, :price_at_purchase, :subtotal)
    end
end
