class CakesController < ApplicationController

  def index
    @cakes = CakeService.getAllCakes
  end

  def new
    @cake = Cake.new
  end

  def create
    @cake = Cake.new(cake_params)
    @is_cake_create = CakeService.createCake(@cake)
    if @is_cake_create && @cake.valid?
      redirect_to home_page_path
    else
      render new_cake_path
    end
  end
 
  def edit
    @cake = CakeService.getCakeByID(params[:id])
  end


  def update
    @cake = CakeService.getCakeByID(params[:id])
    @is_cake_update  = CakeService.updateCake(@cake,cake_params)
    if  @is_cake_update
      flash[:success] = "Cake Updated successfully" 
      redirect_to @cake
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @cake = CakeService.getCakeByID(params[:id])
    @is_cake_destroy  = CakeService.destroy(@cake)
    if  @is_cake_destroy
      redirect_to @cake
    end
  end
  
  def import
    @cakes = Cake.all
    if params[:file].present?
    Cake.import(params[:file], current_user.id)
    redirect_to root_path, notice: "CSV Imported"
    else
    redirect_to new_cakes_path, notice: "You need to choose a file first!"
    end
  end

  private
  def cake_params
    params.require(:cake).permit(:image, :name, :description, :price).merge(user_id: current_user.id)
  end

end
