require './lib/product'

class ShoppingCart

attr_reader :name, :capacity, :products
def initialize(name, capacity)
  @name = name
  @capacity = capacity.delete_suffix('items').to_i
  @products = []
end

def add_product(product)
  @products << product
end

def details
  details = {name: @name, capacity: @capacity}
end
end
