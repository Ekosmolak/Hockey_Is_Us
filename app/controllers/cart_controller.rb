class CartController < ApplicationController
  def create
    logger.debug("Adding #{params[:id]} to cart.")
    id = params[:id].to_i
    session[:shopping_cart] << id
    product = Product.find(id)
    flash[:notice] = "✚ #{product.model} added to cart."
    redirect_to products_path
  end

  def destroy
    # remove params[:id] from cart
    id = params[:id].to_i
    session[:shopping_cart].delete(id)
    product = Product.find(id)
    flash[:notice] = "− #{product.model} removed from cart...."
    redirect_to products_path
  end

  def show
    @cart_items = cart
  end
end
