require './lib/product'

class ShoppingCart
  attr_reader :name,
              :capacity,
              :products,
              :details

  def initialize(name, capacity)
    @name = name
    @capacity = capacity.delete("items").to_i
    @products = []
    @details = {name: @name, capacity: @capacity}
  end

  def add_product(product)
    total = 0
    @products.each { |item| total += item.quantity }
    if total + product.quantity <= capacity
      @products << product
    end
  end

  def total_number_of_products
    curent_total = 0
    @products.each { |item| curent_total += item.quantity }
    curent_total
  end

  def is_full?
    cart_total = 0
    @products.each { |item| cart_total += item.quantity }
    cart_total >= @capacity
  end

end
