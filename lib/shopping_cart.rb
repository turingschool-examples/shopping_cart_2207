class Cart

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

  def details
    hash = Hash.new
    hash[:name] = @name
    hash[:capacity]= @capacity
    hash
  end

  def total_number_of_products
    product_count = 0
    @products.each do |product|
      product_count += product.quantity 
    end
    product_count
  end

  def is_full?
    if self.total_number_of_products >= self.capacity
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

  def percentage_occupied
    (self.total_number_of_products / self.capacity.to_f * 100).round(2)
  end

  def sorted_products_by_quantity
    @products.map do |product|
      product.quantity
    end.sort
  end


end