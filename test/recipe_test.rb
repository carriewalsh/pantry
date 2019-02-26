require "./test/test_helper"

class RecipeTest < MiniTest::Test
  def setup
    @cheese = Ingredient.new("Cheese","C",100)
    @mac = Ingredient.new("Macaroni","oz",30)
    @mac_and_cheese = Recipe.new("Mac and Cheese")
  end

  def test_recipe_exists
    assert_instance_of Recipe, @mac_and_cheese
  end

  def test_recipe_has_name
    assert_equal "Mac and Cheese", @mac_and_cheese.name
  end
end
