class CartController < ApplicationController
  before_action :initialize_session
  helper_method :cart


  def show
    session[:shopping_cart] << id
    @cart_items = @cart.all
    redirect_to cart_path
  end

  def create
    logger.debug("Adding #{params[:id]} to cart.")
    id = params[:id].to_i
    session[:shopping_cart] << id
    product = Product.find_by(id: params[:id])
    flash[:notice] = "✚ #{product.model} added to cart."
    redirect_to products_path
  end

  def destroy
    id = params[:id].to_i
    session[:shopping_cart].delete(id)
    product = Product.find_by(id: params[:id])
    flash[:notice] = "− #{product.model} removed from cart...."
    redirect_to products_path
  end
end
