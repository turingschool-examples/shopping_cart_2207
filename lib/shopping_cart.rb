require './lib/product'

class ShoppingCart
  attr_reader :name, :capacity, :details, :products

  def initialize(store, capacity)
    @name = store 
    @cap_str = capacity
    @capacity = capacity[/\d+/].to_i
    @products = []
    @details = {
      name: store, 
      capacity: @capacity
    }
  end

  def add_product(product)
    @products << product
  end

  def total_number_of_products
    total = 0
    @products.each do |product|
      total += product.quantity
    end
    total
  end

  def is_full?
    total_number_of_products >= capacity
  end

  def products_by_category(category)
    @products.find_all { |product| product.category == category }
  end

  def percentage_occupied
    ((total_number_of_products / capacity.to_f) * 100).round(2)
  end

  def products_sorted_by_quantity
    by_quant = []
    storage = @products
    @products.count.times do 
      by_quant << storage.delete(storage.max_by {|subprod| subprod.quantity})
    end
    by_quant
  end

  def product_breakdown
    cats = []
    @products.each do |product|
      if (cats.include?(product.category)) != true
          cats << product.category
      end
    end
    prod_by_cat_hash = {}
  
    cats.each do |cat|
      prod_by_cat_hash.store(cat, @products.find_all { |prod| prod.category == cat})
    end
    prod_by_cat_hash
  end
end
