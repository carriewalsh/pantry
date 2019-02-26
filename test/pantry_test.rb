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

end
