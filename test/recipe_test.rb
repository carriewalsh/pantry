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

  def test_recipe_starts_with_no_ingredients_by_default
    assert_equal ({}), @mac_and_cheese.ingredients_required
  end

  def test_recipe_can_have_ingredients_added
    @mac_and_cheese.add_ingredient(@cheese,2)
    @mac_and_cheese.add_ingredient(@mac,8)
    expected = {@cheese => 2,
                @mac => 8}
    assert_equal expected, @mac_and_cheese.ingredients_required
  end

  def test_recipe_can_find_amount_required_for_ingredient
    @mac_and_cheese.add_ingredient(@cheese,2)
    @mac_and_cheese.add_ingredient(@mac,8)
    assert_equal 2, @mac_and_cheese.amount_required(@cheese)
    assert_equal 8, @mac_and_cheese.amount_required(@mac)
  end
end
