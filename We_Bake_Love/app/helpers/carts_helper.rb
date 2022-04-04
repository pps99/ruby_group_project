module CartsHelper
  def current_cart
    if !session[:cart_id].nil?
      Cart.find(session[:cart_id])
    else
      Cart.new
    end
  end

#  def basket_total
#    Cake.where(id: cart_id.to_a).sum(:price)
#  end
#
#  def basket
#    session[:cart_id] ||= Set.new
#  end
end
