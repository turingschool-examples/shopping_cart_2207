class ShoppingCart
  attr_reader :name, :capacity, :products

  def initialize(name, capacity)
    @name = name
    @capacity = capacity.to_i
    @products = []
  end

  def add_product(product)
    @products << product
  end

  def details
    details = {name: @name, capacity: @capacity}
  end

  def total_number_of_products
    products.map { |product| product.quantity }.sum
  end

  def is_full?
    if total_number_of_products >= @capacity
      true
    else
      false
    end
  end

  def products_by_category(category)
    products.select { |product| product.category == category }
  end

  def percent_occupied
    ((total_number_of_products / @capacity.to_f).truncate(4)) * 100
  end

  def sorted_products_by_quantity
    products.sort_by { |product| product.quantity }.reverse
  end
end
