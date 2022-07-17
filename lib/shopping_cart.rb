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
    cart_capacity = @capacity.gsub("items", "").to_i
    new_hash = Hash.new(0)
    new_hash[:name] = @name
    new_hash[:capacity] = cart_capacity
    new_hash
  end

  def total_number_of_products
    @products.map { |product| product.quantity.to_i }.sum
  end

  def is_full?
    total_number_of_products > @capacity.gsub("items", "").to_i
  end

  def products_by_category(category)
    @products.select { |product| product.category == category }
  end

  def percentage_occupied
    # I want this method to divide the total capacity by the current amount
    # total capacity / current amount
    ((total_number_of_products).to_f / (@capacity.gsub("items", "").to_i) * 100).round(2)
  end

  def sorted_products_by_quantity
    # I want this method to access the product
    # quantities and sort them from largest to smallest
    # create and array of product quantites and use .max method to sort
    # array


    @products.map do |product|
      product.quantity.to_i
    end



  end
end