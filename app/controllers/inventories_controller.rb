class InventoriesController < InheritedResources::Base

  private

    def inventory_params
      params.require(:inventory).permit(:product_id, :stock_level)
    end

end
