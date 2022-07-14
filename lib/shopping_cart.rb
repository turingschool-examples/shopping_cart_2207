require './lib/product.rb'

class ShoppingCart
  attr_reader :name, :capacity, :products, :details

  def initialize(name, capacity)
    @name = name
    @capacity = capacity.to_i
    @products = []
    @details = {name: name, capacity: capacity.to_i}
  end

  def add_product(product)
    @products << product
  end

end
