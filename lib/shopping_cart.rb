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

end