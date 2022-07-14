require './lib/product'

class ShoppingCart

    attr_reader :name,
                :capacity,
                :products

    def initialize(name, capacity)
        @name = name
        @capacity = capacity[0..-6].to_i
        @products = []
    end

end