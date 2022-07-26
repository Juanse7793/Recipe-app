class PublicsController < ApplicationController
  def index 
    @publics = Receipt.all
  end
end
