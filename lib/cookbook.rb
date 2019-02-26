class Cookbook
  attr_reader :recipes
  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    !@recipes.include?(recipe) ? @recipes << recipe : @recipes
  end

  def summary
    @recipes.map {|recipe| recipe.summary}
  end
end
