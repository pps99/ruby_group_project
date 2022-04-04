class OrderRepository
  class << self
    def getAllOrders
      @orders = Order.all()
    end

    #def getOrderByID(id)
    #  @order = Order.find(id)
    #end

    def updateOrder(order, order_params)
      @is_order_update = order.update(order_params)
    end

    
    def createOrder(order)
      @is_order_create = order.save
     
    end
  end
end
