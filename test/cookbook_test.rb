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
    @cookbook.add_recipe(@mac_and_cheese)
    @cookbook.add_recipe(@burger)
    assert_equal [@mac_and_cheese,@burger], @cookbook.recipes
  end

  def test_cookbook_cannot_have_duplicate_recipes
    @cookbook.add_recipe(@mac_and_cheese)
    @cookbook.add_recipe(@burger)
    @cookbook.add_recipe(@burger)
    assert_equal [@mac_and_cheese,@burger], @cookbook.recipes
  end

  def test_cookbook_can_print_summary_of_recipes
    @cookbook.add_recipe(@mac_and_cheese)
    @cookbook.add_recipe(@burger)
    expected = [{
                name:"Mac and Cheese",
                details: {
                  ingredients: [{
                                ingredient: "Cheese",
                                amount: "2 C"},
                                {
                                ingredient: "Macaroni",
                                amount: "8 oz"}],
                  total_calories: 440}},
                {
                name: "Burger",
                details:{
                  ingredients: [{
                                ingredient: "Ground Beef",
                                amount: "4 oz"},
                                {
                                ingredient: "Bun",
                                amount: "100 g"}],
                  total_calories: 500}}]
    assert_equal expected, @cookbook.summary
  end
end
