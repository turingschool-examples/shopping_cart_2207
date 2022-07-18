class ShoppingCart
    attr_reader :name, :capacity, :products, :details
    def initialize(name, capacity)
        @name = name
        @capacity = capacity.to_i
        @products = []
        @details = { name: @name, capacity: @capacity }
        @quantity_of_products = 0
    end

    def add_product(product)
        @products << product
        @quantity_of_products += product.quantity
    end

    def total_number_of_products
        @quantity_of_products
    end

    def is_full?
        @quantity_of_products >= @capacity
    end

    def products_by_category(category)
        @products.find_all { |product| product.category == category }
    end

end

