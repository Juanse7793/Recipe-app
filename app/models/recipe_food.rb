class RecipeFood < ApplicationRecord
  belongs_to :receipt
  belongs_to :food

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
