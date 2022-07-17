class ShoppingCart
    attr_reader :name,
                :capacity,
                :products
    def initialize(name, capacity)
        @name = name
        @capacity = capacity.slice(0,2).to_i
        @products = []
    end

    def add_product(product)
        @products << product
    end

    def details
        details = {:name => @name, :capacity => @capacity}
    end

    def total_number_of_products
        total = @products.map {|product| product.quantity}.sum
    end

    def is_full?
        return true if total_number_of_products >= @capacity
        false
    end

    def products_by_category(category)
        categorized = []
        @products.each do |product|
            if product.category == category
                categorized << product
            end
        end
        categorized
    end
end