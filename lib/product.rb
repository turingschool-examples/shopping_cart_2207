class Product

  attr_reader :category, :name, :unit_price, :quantity, :hoard

  def initialize(category, name, price, quantity)
    @category = category
    @name = name
    @unit_price = price
    @quantity = quantity
    @hoard = false
  end

  def total_price
  # require "pry"; binding.pry
  unit_price * quantity.to_i
  end

  def is_hoarded?
    @hoard
  end

  def hoard
    @hoard = true
  end

end
