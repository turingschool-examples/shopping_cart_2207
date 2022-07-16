class Product
  attr_reader :category, :name, :unit_price, :quantity, :total_price

  def initialize(category, name, unit_price, quantity)
    @category = category
    @name = name
    @unit_price = unit_price
    @quantity = quantity.to_i
    @total_price = 0
  end

  def total_price
    @total_price = @unit_price * @quantity
  end

end
