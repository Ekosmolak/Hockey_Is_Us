class CustomersController < InheritedResources::Base
  before_action :authenticate_customer!  # or similar authentication logic

  def show
    @customer = current_customer
  end

  private

    def customer_params
      params.require(:customer).permit(:name, :address, :postal_code, :phone_number, :province, :email, :password, :password_confirmation)
    end
end
