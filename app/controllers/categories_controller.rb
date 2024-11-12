class CategoriesController < InheritedResources::Base

  private

    def category_params
      params.require(:category).permit(:equipment_type, :description)
    end

end
