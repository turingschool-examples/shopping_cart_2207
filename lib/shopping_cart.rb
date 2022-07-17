class ShoppingCart
    attr_reader :name,
                :capacity,
                :products
    def initialize(name, capacity)
        @name = name
        @capacity = capacity[0..1].to_i
        @products = []
    end

    def add_product(product)
        products << product
    end

    def details
        {name: @name, capacity: @capacity}
    end

    def total_number_of_products
        @products.sum {|product| product.quantity}
    end

    def is_full?
        total_number_of_products >= @capacity
    end

    def products_by_category(search_category)
        @products.select {|product| product.category == search_category}
    end
end