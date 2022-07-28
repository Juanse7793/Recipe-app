class PublicsController < ApplicationController
  def index
    @publics = Receipt.includes([:user, :recipe_foods]).where(public: true).order(created_at: :desc)
  end
end
