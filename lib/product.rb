class Product
  attr_reader :category, :name

  def initialize(category, name, price, quantity)
    @category = category
    @name = name
    @price = price.to_s
    @quantity = quantity
    @hoarded = false
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

  def is_hoarded?
    @hoarded
  end
  
  def hoard
    @hoarded = true
  end
end