class ReceiptsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @receipts = Receipt.includes([:user]).where(user: @user).or(Receipt.where(public: true))
  end

  def show
    @receipt = Receipt.find(params[:id])
  end

  def add_food_view
    @receipt = Receipt.find(params[:receipt_id])
    render 'add_food'
  end

  def add_food
    @receipt = Receipt.find(params[:receipt_id])
    @food = Food.find(params[:food_id])
    @receiptfood = RecipeFood.includes([:food]).new(quantity: params[:quantity], food: @food, receipt: @receipt)
    if @receiptfood.save
      redirect_to user_receipt_path(id: @receipt.id)
    else
      print @receiptfood
      render :new
    end
  end

  def remove_food
    @receipt = Receipt.find(params[:receipt_id])
    @food = RecipeFood.includes([:food]).find(params[:id])
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
      print 'Failed to Save User'
      render :new
    end
  end

  def destroy
    @receipt = Receipt.find(params[:id])
    @receipt.destroy
    redirect_to user_receipts_path
  end

  def receipt_params
    params.require(:receipt).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
