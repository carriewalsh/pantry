class Pantry
  attr_reader :stock
  def initialize
    @stock = Hash.new {|hash,key| hash[key] = 0}
  end

  def check_stock(ingredient)
    @stock[ingredient]
  end

  def restock(ingredient,amount)
    @stock[ingredient] += amount
  end

  def enough_ingredients_for?(recipe)
    recipe.ingredients_required.all? do |ingredient, amount|
      @stock[ingredient] >= amount
    end
  end
end
