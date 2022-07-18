class Product 
  attr_reader :category, :name, :unit_price, :quantity
  def initialize(category, name, unit_price, quantity)
    @category = :category
    @name = name
    @unit_price = 0.0
    @quantity = 0.0

  end

end