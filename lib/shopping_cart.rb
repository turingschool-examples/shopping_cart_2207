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

  def percentage_occupied
    (100 * @total_number_of_products / @capacity.to_f).to_f.floor(2)
  end

  def sorted_products_by_quantity
    products.sort_by {|product| -product.quantity}
  end

  def product_breakdown
    prod_breakdown = {}
    products.each do |product|
      prod_breakdown[product.category] = products_by_category(product.category)
    end
    prod_breakdown
  end
end
