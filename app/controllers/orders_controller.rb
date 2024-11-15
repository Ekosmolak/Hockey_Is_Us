class OrdersController < InheritedResources::Base

  private

    def order_params
      params.require(:order).permit(:order_item_id, :customer_id, :total_price)
    end

end
