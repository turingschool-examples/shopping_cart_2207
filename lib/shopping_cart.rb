class ShoppingCart
  attr_reader :name,
              :capacity,
              :products

  def initialize(name, capacity)
    @name = name
    @capacity = capacity.delete('items').to_i
    @products = []
  end

  def add_product(product)
    @products << product
  end

  def total_number_of_products
    products.sum {|product| product.quantity}
  end

  def is_full?
    total_quantity = total_number_of_products

    total_quantity > @capacity
  end

  def products_by_category(category)
    products.find_all {|product| product.category == category}
  end

  def details
    details = Hash.new
    details[:name] = @name
    details[:capacity] = @capacity
    details
  end

  def percentage_occupied
    percent = (total_number_of_products / @capacity.to_f) * 100
    percent.round(2)
  end

  def sorted_products_by_quantity
    products.sort_by {|product| product.quantity}.reverse
  end

  def product_breakdown
    @products.reduce({}) do |list, product|
      list[product.category] = products_by_category(product.category)
      list
    end
  end
end
