class ShoppingsController < ApplicationController
  def index
    @shoppings = Food.all
  end
end
