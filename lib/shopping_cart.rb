class ShoppingCart
  attr_reader :name,
              :capacity,
              :products

  def initialize(name, capacity)
    @name = name
    @capacity = capacity.to_i
    @products = []
  end

  def add_product(product)
    products.find_all do |product|
      @product << product
    end
  end

  def details
    ({:name.keys, :capacity.keys})
  end
end
