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
  end

  def add_product(product)
    @products << product
  end

  def total_number_of_products
    @products.sum { |product| product.quantity }
  end

  def is_full?
    if total_number_of_products >= @capacity
      true
    else
      false
    end     
  end

  def products_by_category(category)
    products.find_all do |product|
      product.category == category
    end
  end

  def percentage_occupied
    decimal = (total_number_of_products.to_f / @capacity)
    output = sprintf('%.2f', (decimal * 100))
    output.to_f
  end

  def sorted_products_by_quantity
    products.sort_by do |product|
      product.quantity
    end.reverse
  end

  def product_breakdown
    products.group_by do |product|
      product.category
    end
  end
end