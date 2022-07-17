require './lib/product'

class ShoppingCart
  attr_reader :name, :capacity, :products

  def initialize(name, capacity)
    @name = name
    @capacity = capacity.delete("^0-9").to_i
    @products = []
  end

  def add_product(product)
    @products << product
  end

  def details
    {name: @name, capacity: @capacity}
  end

  def total_number_of_products
    count = 0
    @products.each do |product|
      count += product.quantity
    end
    count
  end

  def is_full?
    return true if total_number_of_products > @capacity
    false
  end

  def products_by_category(cat)
    @products.select{|product| product.category == cat}
  end

  def percentage_occupied
    (100 * total_number_of_products / @capacity.to_f).round(2)
  end

  def sorted_products_by_quantity
    @products.sort_by{|product| -product.quantity}
  end

  def product_breakdown
    #generate keys
    breakdown = Hash.new{|hash, key| hash[key] = []}

    keys = @products.map{|product| product.category}.uniq
    @products.each do |product|
      breakdown[product.category] << product
    end
    breakdown
  end
end
