class ShoppingCart
  attr_reader :name, :capacity, :products, :details

  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @products = []
    @details = Hash.new
    @details[:name] = name
    @details[:capacity] = capacity.delete_suffix("items").to_i
  end

  def add_product(product)
    @products << product
  end

end
