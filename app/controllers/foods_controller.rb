class FoodsController < ApplicationController
  def index
    @users = User.all
    @foods = Food.all
  end
end
