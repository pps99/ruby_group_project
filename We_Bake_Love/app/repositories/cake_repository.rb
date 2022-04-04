class CakeRepository
  class << self
    def getAllCakes
      @cakes = Cake.all.with_attached_image
    end

    def createCake(cake)
      @is_cake_create = cake.save
    end

    def getCakeByID(id)
      @cake = Cake.find(id)
    end

    def updateCake(cake, cake_params)
      @is_cake_update = cake.update(cake_params)
    end

    def destroy(cake)
      @is_cake_destroy = cake.destroy
    end
  end
end
