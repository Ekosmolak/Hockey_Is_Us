class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :authenticate_customer!
  before_action :initialize_session

  helper_method :cart

  # Shopping Cart Initialization
  def initialize_session
    session[:shopping_cart] ||= []
  end

  # Use Devise's built-in helpers
  def customer_signed_in?
    current_customer.present?
  end
end
