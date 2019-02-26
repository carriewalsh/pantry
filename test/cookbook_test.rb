require "./test/test_helper"

class CookbookTest < MiniTest::Test
  def setup
    @cheese = Ingredient.new("Cheese","C",100)
    @mac = Ingredient.new("Macaroni","oz",30)
    @mac_and_cheese = Recipe.new("Mac and Cheese")
    @mac_and_cheese.add_ingredient(@cheese,2)
    @mac_and_cheese.add_ingredient(@mac,8)
    @ground_beef = Ingredient.new("Ground Beef","oz",100)
    @bun = Ingredient.new("Bun","g",1)
    @burger = Recipe.new("Burger")
    @burger.add_ingredient(@ground_beef,4)
    @burger.add_ingredient(@bun,100)
    @cookbook = Cookbook.new
  end

  def test_cookbook_exists
    assert_instance_of Cookbook, @cookbook
  end

  def test_cook_book_starts_with_no_recipes_by_default
    assert_equal [], @cookbook.recipes
  end

  def test_cookbook_can_have_recipes_added
    assert_equal [@mac_and_cheese,@burger], @cookbook.recipes
  end
end
