class CustomersController < InheritedResources::Base

  private

    def customer_params
      params.require(:customer).permit(:name, :address, :postal_code, :phone_number, :email)
    end

end
