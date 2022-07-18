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
    total = 0
    @products.sum do |product|
      total += product.quantity   
    end
    return total
  end

  def is_cart_full?
    total_number_of_products > @capacity
  end

  def products_by_category(category)
    product_list = @products.find_all do |product|
      product.category == category
    end
    return product_list
  end

  def percentage_occupied
    ((total_number_of_products.to_f / @capacity) * 100).round(2)
  end
end