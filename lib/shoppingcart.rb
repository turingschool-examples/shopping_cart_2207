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

    def percentage_occupied
        (total_number_of_products.to_f/@capacity * 100).truncate(2)
    end

    def sorted_products_by_quanity
        @products.sort_by { |product| product.quantity }.reverse
    end

    def product_breakdown
        breakdown = {}

        @products.map{|product| breakdown.store(product.category, products_by_category(product.category))}
    end
end

# finished 1 hours, 10 minutes.