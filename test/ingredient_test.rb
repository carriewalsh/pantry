require "./test/test_helper"

class IngredientTest < MiniTest::Test
  def setup
    @cheese = Ingredient.new("Cheese","oz",50)
  end

  def test_ingredient_exists
    assert_instance_of Ingredient, @cheese
  end

  def test_ingredient_has_name
    assert_equal "Cheese", @cheese.name
  end

  def test_ingredient_has_unit
    assert_equal "oz", @cheese.unit
  end

  def test_ingredient_has_calories
    assert_equal 50, @cheese.calories
  end
end
