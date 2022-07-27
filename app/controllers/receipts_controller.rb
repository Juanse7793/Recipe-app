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
    @receipt = Receipt.find(params[:receipt_id])
    @food = Food.find(recipe_food_params[:food_id])
    @receiptfood = RecipeFood.new(quantity: recipe_food_params[:quantity], food: @food, receipt: @receipt)
    if @receiptfood.save
      redirect_to receipts_path
    else
      print @receiptfood
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
