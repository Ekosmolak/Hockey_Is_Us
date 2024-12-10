class CartController < ApplicationController
  def create
    product = Product.find(params[:product_id]) # Use the correct parameter key
    # Assuming you have a `cart` object or method
    cart << product.id
    flash[:notice] = "#{product.model} has been added to your cart."
    redirect_to products_path
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The product could not be found."
    redirect_to products_path
  end

  def destroy
    # remove params[:id] from cart
    id = params[:product_id].to_i
    session[:shopping_cart].delete(id)
    product = Product.find(id)
    flash[:notice] = "− #{product.model} removed from cart...."
    redirect_to products_path
  end
end
