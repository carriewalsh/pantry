class Pantry
  attr_reader :stock
  def initialize
    @stock = {}
  end

  def check_stock(ingredient)
    @stock[ingredient] == nil ? 0 : @stock[ingredient]
  end
end
