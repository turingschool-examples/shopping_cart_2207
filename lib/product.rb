class Product
  attr_reader :category, :name

  def initialize(category, name, price, quantity)
    @category = category
    @name = name
    @price = price.to_s
    @quantity = quantity
  end

  def unit_price
    @price.to_f
  end

  def quantity 
    @quantity.to_i 
  end

  def total_price
    @price.to_f * @quantity.to_f
  end
end