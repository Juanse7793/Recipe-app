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

  def add_food_view
    render 'add_food'
  end

  def add_food
    @receipt = Receipt.find(params[:receipt_id])
    @food = Food.find(params[:food_id])
    @receiptfood = RecipeFood.new(quantity: params[:quantity], food: @food, receipt: @receipt)
    if @receiptfood.save
      redirect_to user_receipt_path(id: @receipt.id)
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
end
