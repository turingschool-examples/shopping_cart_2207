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
      capacity: @capacity
    }
  end

  def add_product(product)
    @products << product
  end

  def total_number_of_products
    total = 0
    @products.each do |product|
      total += product.quantity
    end
    total
  end

  def is_full?
    total_number_of_products >= capacity
  end

  def products_by_category(category)
    @products.find_all { |product| product.category == category }
  end
end