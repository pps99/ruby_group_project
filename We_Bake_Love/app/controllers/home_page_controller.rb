class HomePageController < ApplicationController
  def index 
    @cakes = Cake.all
    # cart
    @cart_item = current_cart.cart_items.new
    

    render "index"
  end
  def new
    @cart_item = cart_item.new
end
    
  def show
      @cakes = Cake.all
      render "index"
  end

  def search 
    @cakes = Cake.where("cakes.name LIKE ?",["%#{params[:query]}%"])
    render "index"
  end
end
