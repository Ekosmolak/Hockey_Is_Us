class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :authenticate_customer!
  protect_from_forgery with: :exception

  before_action :initialize_session

  helper_method :cart

  # Shopping Cart Initialization
  def initialize_session
    session[:shopping_cart] ||= []
  end


  def after_sign_in_path_for(resource)
    root_path
  end

  # Use Devise's built-in helpers
  def customer_signed_in?
    current_customer.present?
  end
end
