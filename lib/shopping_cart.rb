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

    def total_number_of_products
        @products.sum { |product| product.quantity }
    end

    def is_full?
        total_number_of_products > @capacity
    end

    def products_by_category(category)
        @products.select { |product| product.category == category }
    end

end