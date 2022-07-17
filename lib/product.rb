class Product
  attr_reader :category,
              :name,
              :quantity, 
              :unit_price

  def initialize(category, name, unit_price, quantity)
    @category = category
    @name = name
    @quantity = quantity.to_i
    @unit_price = unit_price
  end

  def total_price
    unit_price * quantity
  end
  
end