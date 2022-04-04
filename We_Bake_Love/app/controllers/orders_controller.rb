class OrdersController < ApplicationController
  def index
    @orders = OrderService.getAllOrders
  end

  def show
    @order = OrderService.getOrderByID(params[:id])
  end

#  def accept
#    @order = Order.find(params[:format])
#    @sql = "update orders set status='accepted' where id =#{@order.id} ;"
#    ActiveRecord::Base.connection.execute(@sql)
#    redirect_to orders_path
#  end
#
#  def cancel
#    @order = Order.find(params[:format])
#    @sql = "update orders set status='cancelled' where id =#{@order.id} ;"
#    ActiveRecord::Base.connection.execute(@sql)
#    redirect_to orders_path
#  end

  def edit
    @order = OrderService.getOrderByID(params[:id])
  end

  def update
    @order = OrderService.getOrderByID(params[:id])
    @is_order_update = OrderService.updateOrder(@order, order_params)
    if @is_order_update
      flash[:success] = "Order Updated successfully"
      redirect_to @order
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order).permit(:user_id, :user_details_id, :status, :total)
  end


end
