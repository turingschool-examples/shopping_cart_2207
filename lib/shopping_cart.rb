class ShoppingCart

  attr_reader :name, 
              :capacity, 
              :products, 
              :details
  
  def initialize(name, capacity)
    @name = name
    @capacity = capacity.to_i
    @products = []
    @details = {name: @name, capacity: @capacity}
    @cart_capacity = 0
  end  

  def add_product(product)
    @products << product
  end

  def total_number_of_products
    @products.sum do |product|
      total += product.quantity
    end
  end

  def is_cart_full?
    total_number_of_products > @capacity
  end

  def products_by_capacity

    @products.find_all? do |product|
      product.category == category
    end
  end
end