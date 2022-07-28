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

  def new 
    @receipt = Receipt.new
    @user = current_user
  end

  def create
    @receipt = Receipt.new(receipt_params)
    @receipt.user = current_user
    print receipt_params
    if @receipt.save
      redirect_to user_receipts_path
    else
      print "Failed to Save User"
      render :new
    end
  end

  def receipt_params
    params.require(:receipt).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
