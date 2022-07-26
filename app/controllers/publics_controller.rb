class PublicsController < ApplicationController
  def index 
    @publics = Receipt.where(:public => true)
  end
end
