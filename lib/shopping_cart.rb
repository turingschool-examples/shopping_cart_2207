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
        cart_details = {
        name: @name,
        capacity: @capacity.delete("items").to_i }
    end

    def total_number_of_products
        @products.map do |product|
            product.quantity
        end.sum
    end

    def is_full?
        total_number_of_products >= @capacity.delete("items").to_i
    end

    def products_by_category(category)
        @products.select { |product| product.category == category }
    end

    def percentage_occupied
        ((total_number_of_products.to_f / @capacity.delete("items").to_f) * 100).round(2)
    end

    def sorted_products_by_quantity
        @products.sort_by do |product|
            -product.quantity
        end
    end

    def product_breakdown
        product_breakdown = {
            :meat => [],
            :paper => [],
            :produce => []
        }

        @products.each do |product|
            if product.category == :meat
                product_breakdown[:meat] << product
            elsif product.category == :paper
                product_breakdown[:paper] << product
            elsif product.category == :produce
                product_breakdown[:produce] << product
            end
        end
        product_breakdown
    end
end