class ShoppingCart 
  attr_reader :name, :capacity, :products, :details
  
  def initialize(name, capacity)
    @name = name
    @capacity = capacity.gsub("items", "").to_i
    @products = []
    @details = {}
  end

  def add_product(product)
    @products << product
  end

  def details 
    @details[:name] = name
    @details[:capacity] = capacity
    @details
  end

  def total_number_of_products  
    total_product_quantity = []
    products.each do |product|
      total_product_quantity << product.quantity
    end
    total_product_quantity.sum
  end

  def is_full?
    if total_number_of_products > capacity
      true
    else
      false
    end
  end

  def products_by_category(category)
    category_of_products = products.group_by do |product|
      product.category
    end
    category_of_products[category]
  end

  def percentage_occupied
    (total_number_of_products.to_f / capacity).truncate(4) * 100
  end

  def sorted_products_by_quantity
    by_quantity = products.sort_by do |product|
      product.quantity
    end
    by_quantity.reverse
  end
end 
