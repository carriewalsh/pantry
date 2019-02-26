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
    details_hash = {ingredients: [],total_calories: total_calories}
    @ingredients_required.each do |ingredient,amount|
      details_hash[:ingredients] << ingredient_hash(ingredient)
    end
    details_hash
  end

  def summary
    {name: "#{@name}", details: details}
  end
end
