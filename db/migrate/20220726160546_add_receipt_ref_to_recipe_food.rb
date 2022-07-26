class AddReceiptRefToRecipeFood < ActiveRecord::Migration[7.0]
  def change
    add_reference :recipe_foods, :receipt, null: false, foreign_key: true
  end
end
