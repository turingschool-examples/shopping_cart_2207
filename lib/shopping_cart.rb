require './lib/product'

class ShoppingCart
  attr_reader :name, :capacity, :details, :products

  def initialize(store, capacity)
    @name = store 
    @cap_str = capacity
    @capacity = capacity[/\d+/].to_i
    @products = []
    @details = {
      name: store, 
      capacity: @int_cap
    }
  end


end