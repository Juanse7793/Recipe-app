class PublicsController < ApplicationController
  def index
    @publics = Receipt.where(public: true).order(created_at: :desc)
  end
end
