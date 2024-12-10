class ProductsController < InheritedResources::Base
  def index
    @products = Product.page(params[:page]).per(10)
  end

  def search
    @products = Product.all

    if params[:keywords].present?
      @products = @products.joins(:brand).where("products.model LIKE ? OR brands.name LIKE ?", "%#{params[:keywords]}%", "%#{params[:keywords]}%")
    end

    if params[:equipment_type].present?
      category_id = Category.find_by(equipment_type: params[:equipment_type])&.id
      @products = @products.where(category_id: category_id) if category_id
    end

    @products = @products.page(params[:page]).per(10)

    render :index
  end

  def show
    @product = Product.find(params[:id])
  end

  private

  def product_params
    params.require(:product).permit(:brand_id, :model, :category_id, :description, :size, :price, :image)
  end
end
