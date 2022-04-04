class CartsController < ApplicationController
  def show
    @cart_items = CartItem.all
  end
end
