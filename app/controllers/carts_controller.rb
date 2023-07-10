class CartsController < ApplicationController

  def show
    if cart.empty?
      flash[:notice] = "Your cart is empty. Browse our store to find items you would like to buy."
      redirect_to root_path
      @empty_cart_message = "Your cart is empty"

    else
      @cart = cart
    end
  end

  def add_item
    product_id = params[:product_id].to_s
    modify_cart_delta(product_id, +1)
    redirect_back fallback_location: root_path
  end

  def remove_item
    product_id = params[:product_id].to_s
    modify_cart_delta(product_id, -1)
    redirect_back fallback_location: root_path
  end

  private
  def modify_cart_delta(product_id, delta)
    cart[product_id] = (cart[product_id] || 0) + delta
    cart.delete(product_id) if cart[product_id] < 1
    update_cart cart
  end
  
end