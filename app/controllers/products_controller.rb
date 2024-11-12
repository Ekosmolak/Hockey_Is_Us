class ProductsController < InheritedResources::Base

  private

    def product_params
      params.require(:product).permit(:brand_id, :model, :category_id, :description, :size, :price)
    end

end
