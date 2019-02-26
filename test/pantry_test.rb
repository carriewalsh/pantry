require "./test/test_helper"

class PantryTest < MiniTest::Test
  def setup
    @pantry = Pantry.new
  end

  def test_pantry_exists
    assert_instance_of Pantry, @pantry
  end

end
