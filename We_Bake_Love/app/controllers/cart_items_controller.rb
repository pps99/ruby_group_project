class CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
  end
  def create
      @cart = current_cart
      @cart_item = @cart.cart_items.new(cart_params)
      @cart.save
      session[:cart_id] = @cart_id
      redirect_to root_path
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_params)
    redirect_to '/carts/show'
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to '/carts/show'
  end

  def cancel
    @sql = "SET SQL_SAFE_UPDATES = 0;"
    ActiveRecord::Base.connection.execute(@sql)
    @sql_delete = "delete  from cart_items;"
    ActiveRecord::Base.connection.execute(@sql_delete)
    @sql_safe_mode = "SET SQL_SAFE_UPDATES = 1;"
    ActiveRecord::Base.connection.execute(@sql_safe_mode)
    redirect_to root_path
  end

  private

  def cart_params
        params.require(:cart_item).permit(:cake_id, :quantity, :cake_name)
  end
end
