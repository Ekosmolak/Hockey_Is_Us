class CustomersController < InheritedResources::Base
  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      session[:customer_id] = @customer.id  # Log the user in after sign-up
      redirect_to root_path, notice: "Welcome, #{@customer.name}!"
    else
      puts @customer.errors.full_messages # This will print errors to the console
      render :new
    end
  end

  private

    def customer_params
      params.require(:customer).permit(:name, :address, :postal_code, :phone_number, :email, :password, :password_confirmation)
    end
end
