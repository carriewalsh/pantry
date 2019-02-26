require "./test/test_helper"

class RecipeTest < MiniTest::Test
  def setup
    @cheese = Ingredient.new("Cheese","C",100)
    @mac = Ingredient.new("Macaroni","oz",30)
    @mac_and_cheese = Recipe.new("Mac and Cheese")
    @mac_and_cheese.add_ingredient(@cheese,2)
    @mac_and_cheese.add_ingredient(@mac,8)
  end

  def test_recipe_exists
    assert_instance_of Recipe, @mac_and_cheese
  end

  def test_recipe_has_name
    assert_equal "Mac and Cheese", @mac_and_cheese.name
  end

  def test_recipe_starts_with_no_ingredients_by_default
    mac_and_cheese = Recipe.new("Mac and Cheese")
    assert_equal ({}), mac_and_cheese.ingredients_required
  end

  def test_recipe_can_have_ingredients_added
    cheese = Ingredient.new("Cheese","C",100)
    mac = Ingredient.new("Macaroni","oz",30)
    mac_and_cheese = Recipe.new("Mac and Cheese")
    mac_and_cheese.add_ingredient(cheese,2)
    mac_and_cheese.add_ingredient(mac,8)
    expected = {cheese => 2,
                mac => 8}
    assert_equal expected, mac_and_cheese.ingredients_required
  end

  def test_recipe_can_find_amount_required_for_ingredient
    assert_equal 2, @mac_and_cheese.amount_required(@cheese)
    assert_equal 8, @mac_and_cheese.amount_required(@mac)
  end

  def test_recipe_can_list_ingredients
    assert_equal [@cheese,@mac], @mac_and_cheese.ingredients
  end

  def test_recipe_can_show_total_calories
    assert_equal 440, @mac_and_cheese.total_calories
  end

  def test_recipe_can_print_ingredient_hash
    expected = {ingredient:"Cheese",
                amount: "2 C"}
    assert_equal expected, @mac_and_cheese.ingredient_hash(@cheese)
  end

  def test_recipe_can_print_recipe_details
    expected = {
      ingredients: [{ingredient: "Cheese",
                      amount: "2 C"},
                      {ingredient: "Macaroni",
                      amount: "8 oz"}],
      total_calories: 440}
    assert_equal expected, @mac_and_cheese.details
  end

  def test_recipe_can_print_recipe_summary
    expected = {name:"Mac and Cheese",
                details: {
                  ingredients: [{ingredient: "Cheese",
                                amount: "2 C"},
                                {ingredient: "Macaroni",
                                amount: "8 oz"}],
                  total_calories: 440}}
    assert_equal expected, @mac_and_cheese.summary
  end
end
