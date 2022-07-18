require './lib/product'
class ShoppingCart
    attr_reader :name, :capacity, :products, :details

    def initialize(name, capacity)
        @name = name
        @capacity = capacity.to_i
        @products = []
        @details = {name: "King Soopers", capacity: 30}
    end

    def add_product(product)
        @products << product
    end

end