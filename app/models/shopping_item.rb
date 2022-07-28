class ShoppingItem 
    attr_accessor :requiredQuantity, :food
    def initialize(food,requiredQuantity)
      @food=food;
      @requiredQuantity = requiredQuantity
    end
end