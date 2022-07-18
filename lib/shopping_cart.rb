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
    details_hash = {
      'name' => @name,
      'capacity' => @capacity
    }
  end

  def total_number_of_products
    @products.sum do |product|
      product.quantity.to_i
    end
  end

  def is_full?
    total_number_of_products > @capacity[0..-5].to_i
  end

  def products_by_category(category)
    @products.find_all do |product|
      product.category == category
    end
  end

  def percentage_occupied
    percent = (total_number_of_products / @capacity[0..-5].to_f) *100
    percent.round(2)
  end

  def sorted_products_by_quantity
    @products.sort do |product|
      product.quantity.to_i
    end
  end

  def product_breakdown
    product_hash = {
      :meat => [],
      :paper => [],
      :produce => []

    }
    @products.each do |product|
      if product.category == :meat
        product_hash[:meat] << product
      elsif product.category == :paper
        product_hash[:paper] << product
      elsif product.category == :produce
        product_hash[:produce] << product
      end
    end
    product_hash
  end
end
