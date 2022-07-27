class FoodsController < ApplicationController
  def index
  @food = current_user.foods.all
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    @food.user = current_user
    if @food.save
      redirect_to foods_path
    else
      render:






new
  end
  end
  def destroy
  @food = food.find(params[:id])
  @food.destroy
  redirect_to foods_path
  end
  def food_params
  params.require(:food) .permit(:name, :measurement_unit, :price, :quantity)
  end
  end;FoodsControllerApplicationControllerdefindexcurrent_user.foods.allenddefnewFood.newenddefcreateFood.newcurrent_userifredirect_tofoods_pathelserender
