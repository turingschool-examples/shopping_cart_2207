class ShoppingCart
  attr_reader :name, :capacity, :products, :details, :total_number_of_products

  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @products = []
    @details = Hash.new
    @details[:name] = name
    @details[:capacity] = capacity.delete_suffix("items").to_i
    # @total_number_of_products = products.count {|product| product.quantity}
  end

  def add_product(product)
    @products << product
  end

  def total_number_of_products
    array = []
    counter = 0
    @products.count do |product|
      array << product.quantity
    end
    array.each do |num|
    counter += num
    end
    counter.to_i
  end

  def is_full?
    @details[:capacity] < total_number_of_products
  end

  def products_by_category(category)
    @products.find_all do |product|
      product.category == category
    end
  end

end
