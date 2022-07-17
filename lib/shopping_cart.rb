class ShoppingCart
  attr_reader :name,
              :capacity,
              :products
  def initialize(name, capacity)
    @name = name
    @capacity = capacity.gsub("items", "").to_i
    @products = []
  end

  def add_product(product)
    @products << product
  end

  def details
    # cart_capacity = @capacity.gsub("items", "").to_i
    new_hash = Hash.new(0)
    new_hash[:name] = @name
    new_hash[:capacity] = @capacity
    new_hash
  end

  def total_number_of_products
    @products.map { |product| product.quantity.to_i }.sum
  end

  def is_full?
    total_number_of_products > @capacity
  end
end