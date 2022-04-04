class CakeService
  class << self
    def getAllCakes
      @cakes = CakeRepository.getAllCakes
    end

    def createCake(cake)
      @is_cake_create = CakeRepository.createCake(cake)
    end

    def getCakeByID(id)
      @cake = CakeRepository.getCakeByID(id)
    end

    def updateCake(cake, cake_params)
      @is_cake_update = CakeRepository.updateCake(cake, cake_params)
    end

    def destroy(cake)
      @is_cake_destroy = CakeRepository.destroy(cake)
    end
  end
end
