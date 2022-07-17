class Product

  attr_reader :category,
              :name,
              :unit_price,
              :quantity,
              :product_hoard

  def initialize(category, name, unit_price, quantity)
    @category = category
    @name = name
    @unit_price = unit_price
    @quantity = quantity
    @product_hoard = false

  end

  def total_price
    quantity.to_i * unit_price
  end

  def hoarded?
    if product_hoard == true
      true
    else
      false
    end
  end

  def hoard
    @product_hoard = true
  end
end
