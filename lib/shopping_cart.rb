require './lib/product'
class ShoppingCart
  attr_reader :name, :capacity, :products,
              :details, :total_number_of_products
  def initialize(name, capacity)
    @name = name
    @capacity = capacity.chomp('items').to_i
    @products = []
    @details = {name: name, capacity: @capacity}
    @total_number_of_products = 0
  end

  def add_product(product)
    @products << product
    @total_number_of_products += product.quantity
  end

  def is_full?
    @total_number_of_products > @capacity
  end

  def products_by_category(category)
    @products.find_all do |product|
      product.category == category
    end
  end
end
