class ShoppingCart
  attr_reader :name, :capacity, :products
  def initialize(name, capacity)
    @name = name
    @capacity = capacity.delete("items").to_i
    @products = []
  end

  def add_product(product)
    @products << product
  end

  def details
    {name: @name, capacity: @capacity}
  end

  def total_number_of_products
    total_number_of_products = 0
    @products.each do |product|
      total_number_of_products += product.quantity.to_i
    end
    return total_number_of_products
  end

  def is_full?
    total_number_of_products > @capacity
  end
end
