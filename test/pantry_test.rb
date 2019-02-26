require "./test/test_helper"

class PantryTest < MiniTest::Test
  def setup
    @pantry = Pantry.new
    @cheese = Ingredient.new("Cheese","C",100)
    @mac = Ingredient.new("Macaroni","oz",30)
    @mac_and_cheese = Recipe.new("Mac and Cheese")
    @mac_and_cheese.add_ingredient(@cheese,2)
    @mac_and_cheese.add_ingredient(@mac,8)
  end

  def test_pantry_exists
    assert_instance_of Pantry, @pantry
  end

  def test_pantry_has_empty_stock_by_default
    assert_equal ({}), @pantry.stock
  end

  def test_pantry_can_check_stock_for_ingredient
    assert_equal 0, @pantry.check_stock(@cheese)
  end

  def test_pantry_can_restock_ingredients
    @pantry.restock(@cheese,5)
    assert_equal 5, @pantry.check_stock(@cheese)
    @pantry.restock(@cheese,10)
    assert_equal 15, @pantry.check_stock(@cheese)
  end

  def test_pantry_can_check_if_enough_ingredient
    @pantry.restock(@cheese,5)
    @pantry.restock(@cheese,10)
    assert_equal false, @pantry.enough_ingredients_for?(@mac_and_cheese)
    @pantry.restock(@mac,8)
    assert_equal true, @pantry.enough_ingredients_for?(@mac_and_cheese)
  end
end
