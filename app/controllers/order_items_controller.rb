class OrderItemsController < InheritedResources::Base
  def create
    Rails.logger.debug "Params: #{params.inspect}"
    @product = Product.find(params[:product_id])

    if @product.nil?
      redirect_to root_path
      return
    end



    @session = Stripe::Checkout::Session.create(
      payment_method_types: [ "card" ],
      success_url: checkout_success_url + "?session_id={CHECKOUT_SESSION_ID}",
      cancel_url: checkout_cancel_url,
      line_items: [
        price_data: {
          currency: "cad",
          product_data: {
            brand: @product.brand,
            name: @product.model,
            description: @product.description
          },
          unit_amount: @product.price
        },
        quantity: 1
      ],
      mode: "payment"
    )
    # respond_to do | format |
    # format.js #app/views/checkout/create.js.erb
    # end
    redirect_to @session.url, allow_other_host: true
  end

  def success
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
  end

  def cancel
  end

  private

    def order_item_params
      params.require(:order_item).permit(:product_id, :quantity, :price_at_purchase, :subtotal)
    end
end
