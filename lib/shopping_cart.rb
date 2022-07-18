class ShoppingCart
  attr_reader :name, :capacity, :products


  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @products = []
  end

  def add_products(products)
    @products << product
  end

end
