class ProductsController < InheritedResources::Base
  def index
    if params[:equipment_type].present?
      category_id = Category.find_by(equipment_type: params[:id])
      @products = Product.where(category_id: category_id) if category_id
    else
      @products = Product.all
    end
  end

  def search
    if params[:keywords].present?
      @products = Product.joins(:brand).where("products.model LIKE ? OR brands.name LIKE ?", "%#{params[:keywords]}%", "%#{params[:keywords]}%")
    else
      @products = Product.none
    end
    render :index
  end

  private

  def product_params
    params.require(:product).permit(:brand_id, :model, :category_id, :description, :size, :price, :image)
  end
end
