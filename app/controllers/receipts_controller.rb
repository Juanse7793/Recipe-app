class ReceiptsController < ApplicationController
  def index
    @receipts = Receipt.all
  end

  def show
    @receipt = Receipt.find(params[:id])
  end

  def remove_food
    @receipt = Receipt.find(params[:receipt_id])
    @food = RecipeFood.find(params[:id])
    @receipt.recipe_foods.delete(@food)
    redirect_to user_receipt_path
  end
end
