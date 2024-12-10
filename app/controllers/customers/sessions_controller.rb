
class Customers::SessionsController < Devise::SessionsController
  def create
    super
  end

  # Custom logic for logging out (if needed)
  def destroy
    super
  end
end
