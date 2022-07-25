class Recipe < ApplicationRecord
    belongs_to : user
    has_many : recipe_foods, dependent: :destroy

    validates :name, presence: true, length: { minimum: 3, maximum: 50 }
    validates :description, presence: true, length: { minimum: 1, maximum: 500 }
    validates :preparation_time, presence: true, numericality: { only_float: true, greater_than: 0 }
    validates :cooking_time, presence: true, numericality: { only_float: true, greater_than: 0 }
    validates :public, inclusion: { in: [true, false] }
end


