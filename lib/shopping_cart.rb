require './lib/product'

class ShoppingCart

  attr_reader :name, :capacity, :products
  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @products = []
  end

  def add_product(products)
    @products << products
  end

  def details

  end
end
