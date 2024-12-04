class ProductsController < InheritedResources::Base
  private

    def index
      @products = Product.all
    end

    def product_params
      params.require(:product).permit(:brand_id, :model, :category_id, :description, :size, :price, :image)
    end

    def search
      wild_card_search = "%#{params[:keywords]}%"
      @products = Product.where("model LIKE ?", wild_card_search)
    end
end
