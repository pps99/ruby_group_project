class CartsController < ApplicationController
  def show
    @cart_items = CartItem.all
  end
  def emptyUser
    redirect_to root_path, notice: "Please Login First to order"
  end
  def emptyCart
    redirect_to root_path, notice: "Your Cart is Empty Cannot Order"
  end
end
