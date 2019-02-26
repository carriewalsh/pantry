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

end