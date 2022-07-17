class ShoppingCart
  attr_reader :name,
              :capacity,
              :products

  def initialize(name, capacity)
    @name = name
    @capacity = capacity.to_i
    @products = []
  end

  def add_product(product)
      @products << product
    end
  end

  def total_number_of_products
    @products.map{|product| product.quantity}.sum
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
      products.category == category
  end
end
