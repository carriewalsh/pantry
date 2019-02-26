class Recipe
  attr_reader :name,
              :ingredients_required

  def initialize(name)
    @name = name
    @ingredients_required = {}
  end

  def add_ingredient(ingredient,how_many)
    @ingredients_required[ingredient] = how_many
  end

  def amount_required(ingredient)
    @ingredients_required[ingredient]
  end

  def ingredients
    @ingredients_required.keys
  end

  def total_calories
    @ingredients_required.inject(0) do |sum,(ingredient,amount)|
      sum += ingredient.calories * amount
    end
  end

  def ingredient_hash(ingredient)
    unit = ingredient.unit
    amount = @ingredients_required[ingredient]
    {ingredient:"#{ingredient.name}",amount:"#{amount} #{unit}"}
  end

  def details
    hash = {ingredients: [],total_calories: 0}
    @ingredients_required.each do |ingredient,amount|
      hash[:ingredients] << ingredient_hash(ingredient)
    end
    hash[:total_calories] += total_calories
    hash
  end
end
