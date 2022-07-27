class ReceiptsController < ApplicationController
  def index
    @receipts = Receipt.all
  end

  def show
    @receipt = Receipt.find(params[:id])
  end

  def new
    @receipt = RecipeFood.new
    @foods = Food.all
  end

  def create
    @receiptfood = RecipeFood.new(recipe_food_params)
    @receiptfood.receipt = Receipt.find(params[:receipt_id])
    @receiptfood.food = Food.find(recipe_food_params[:food_id])
    if @receiptfood.save
      redirect_to receipts_path
    else
      render :new
    end
  end

  def remove_food
    @receipt = Receipt.find(params[:receipt_id])
    @food = RecipeFood.find(params[:id])
    @receipt.recipe_foods.delete(@food)
    redirect_to user_receipt_path
  end

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end
end
