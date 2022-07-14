require './lib/product'

class ShoppingCart

    attr_reader :products,
                :details

    def initialize(name, capacity)
        @products = []
        @details = { name: name, capacity: capacity[0..-6].to_i }
    end

    def name
        @details[:name]
    end

    def capacity
        @details[:capacity]
    end

    def add_product(product)
        @products << product
    end

end