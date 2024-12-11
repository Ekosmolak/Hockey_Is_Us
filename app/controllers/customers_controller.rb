class CustomersController < InheritedResources::Base
  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      session[:customer_id] = @customer.id
      redirect_to root_path, notice: "Welcome, #{@customer.name}!"
    else
      puts @customer.errors.full_messages
      render :new
    end
  end

  def show
    @customer = Customer.find(session[:customer_id])
  end

  private

    def customer_params
      params.require(:customer).permit(:name, :address, :postal_code, :province, :phone_number, :email, :password, :password_confirmation)
    end
end
