class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :initialize_session
  helper_method :cart

  def initialize_session
    session[:shopping_cart] ||= []
  end

  def cart
    session[:cart] ||= []
    Product.where(id: session[:cart])
  end
end
