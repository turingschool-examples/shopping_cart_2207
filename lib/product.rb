class Product
  attr_reader :category,
              :name,
              :quantity,
              :unit_price,
              :hoarded

  def initialize(category, name, unit_price, quantity)
    @category = category
    @name = name
    @unit_price = unit_price
    @quantity = quantity.to_i
    @hoarded = hoarded
  end

  def total_price
    unit_price * quantity
  end

  def is_hoarded?
    @hoarded == false
  end

  def hoard
    @hoarded == true
  end
end
