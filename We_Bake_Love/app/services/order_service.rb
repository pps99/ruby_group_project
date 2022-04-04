class OrderService
  class << self
    def getAllOrders
      @orders = OrderRepository.getAllOrders
    end

    #def getOrderByID(id)
    #  @order = OrderRepository.getOrderByID(id)
    #end

    def updateOrder(order, order_params)
      @is_order_update = OrderRepository.updateOrder(order, order_params)
    end

    def createOrder(order)
      @is_user_create = OrderRepository.createOrder(order)
    end
  end
end
