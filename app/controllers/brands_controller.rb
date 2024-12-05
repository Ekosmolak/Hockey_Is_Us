class BrandsController < InheritedResources::Base
  def show
    @brand = Brand.find(params[:id])
    @products = @brand.products
  end

  private

    def brand_params
      params.require(:brand).permit(:name, :image)
    end
end
