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

    def percentage_occupied
        (100 * total_number_of_products / capacity.to_f).round(2)
    end

    def sorted_products_by_quantity
        @products.sort_by { |product| product.quantity }.reverse
    end

    def product_breakdown
        breakdown = Hash.new([])
        # I'm pretty stuck on how to test this one, and how to formulate the code for it
        breakdown
    end

end