require './lib/product.rb'

class ShoppingCart
  attr_reader :name, :capacity, :products, :details

  def initialize(name, capacity)
    @name = name
    @capacity = capacity.to_i
    @products = []
    @details = {name: name, capacity: capacity.to_i}
  end

  def add_product(product)
    @products << product
  end

  def total_number_of_products
    quantities = []
    @products.each do |product|
      quantities << product.quantity
    end
    quantities.sum
  end

  def is_full?
    total_number_of_products > @capacity
  end

  def products_by_category(category)
    @products.find_all do |product|
    product.category == category
    end
  end

  def percentage_occupied
    percent = (total_number_of_products.to_f / @capacity) * 100
    percent.round(2)
  end

  def sorted_product_by_quantity
    sorted_products =
    @products.sort_by do |product|
      product.quantity
    end
    sorted_products.reverse
  end

  def product_breakdown
    product_hash = {}
    product_array = []
      @products.each do |product|
        product_hash[product.category.to_sym] = product_array << product
      end
    product_hash
  end
end
