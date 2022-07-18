require './lib/product'

class ShoppingCart

attr_reader :name, :capacity, :products
def initialize(name, capacity)
  @name = name
  @capacity = capacity.delete_suffix('items').to_i
  @products = []
end

def add_product(product)
  @products << product
end

def details
  details = {name: @name, capacity: @capacity}
end

def total_number_of_products
  total = 0
  @products.each do |product|
    total += product.quantity
  end
  total
end

def is_full?
  total_number_of_products > @capacity
end

def products_by_category(category)
  products.find_all do |product|
    product.category == category
  end
end

def percentage_occupied
  ((total_number_of_products.to_f / @capacity) * 100).round(2)
end

def sorted_products_by_quantity
  starting_products = []
  @products.each {|product| starting_products << product}
  products = []
  loop do
    product = starting_products.max{|a, b| a.quantity <=> b.quantity}
    products << product
    starting_products.delete(product)
    if products.count == @products.count
      break
    end
  end
  products
end


end
