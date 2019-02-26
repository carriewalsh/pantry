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
end
