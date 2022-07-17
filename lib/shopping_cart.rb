class ShoppingCart

  attr_reader :name,
              :capacity,
              :products,
              :detail_hash

  def initialize(name, capacity)
    @name = name
    @capacity = capacity.to_i
    @products = []
    @detail_hash = {}
  end

  def add_product(product)
    @products << product
  end

  def details
    detail_hash = {name: name,
                   capacity: capacity
                 }
  end

  def total_number_of_products
    total = 0
    @products.each do |product|
      total += product.quantity.to_i
    end
    total
  end

  def is_full?
    if total_number_of_products > @capacity
      true
    else
      false
    end
  end

  def products_by_category(category)
    @products.find_all do |product|
      product.category == category
    end
  end
end
