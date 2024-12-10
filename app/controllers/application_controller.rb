class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :initialize_session
  helper_method :cart, :current_customer, :customer_signed_in?

  # Shopping Cart Initialization
  def initialize_session
    session[:shopping_cart] ||= []
  end

  def cart
    session[:cart] ||= []
    Product.where(id: session[:cart])
  end

  def logged_in?
    current_customer.present?
  end

  def require_login
    unless logged_in?
      redirect_to login_path, alert: "You must be logged in to access this section"
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  def current_customer
    @current_customer ||= Customer.find(session[:customer_id]) if session[:customer_id]
  end

  def customer_signed_in?
    current_customer.present?
  end
end
