require './lib/product'

class ShoppingCart
  attr_reader :name, :capacity, :products

  def initialize(name, capacity)
    @name = name
    @capacity = capacity.delete("^0-9").to_i
    @products = []
  end

  def add_product(product)
    @products << product
  end

  def details
    {name: @name, capacity: @capacity}
  end

  def total_number_of_products
    count = 0
    @products.each do |product|
      count += product.quantity
    end
    count
  end

  def is_full?
    return true if total_number_of_products > @capacity
    false
  end

  def products_by_category(cat)
    @products.select{|product| product.category == cat}
  end
end
