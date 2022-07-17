class ShoppingCart
  attr_reader :name,
              :capacity,
              :products

  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @products = []
  end

  def add_product(product)
    @products << product
  end

  def details
    info = Hash.new
    info[:name] = @name
    info[:capacity] = @capacity.delete('items').to_i
    info
  end

  def total_number_of_products
    total = 0
    @products.each do |product|
      total += product.quantity
    end
    total
  end

  def is_full?
    total_number_of_products > @capacity.to_i
  end

  def products_by_category(category)
    @products.find_all {|product| product.category == category}
  end

  def percentage_occupied
    ((total_number_of_products / @capacity.to_f) * 100).round(2)
  end

  def sorted_products_by_quantity
    @products.sort_by {|product| product.quantity}.reverse
  end

  def product_breakdown

  end
end