require './lib/product'

class ShoppingCart

    attr_reader :products,
                :details

    def initialize(name, capacity)
        @products = []
        @details = { 
            name: name, 
            capacity: capacity[0..-6].to_i 
        }
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

    def total_number_of_products
        @products.reduce(0){ |sum, product| sum += product.quantity }
    end

    def is_full?
        total_number_of_products > capacity
    end

    def products_by_category(category)
        @products.find_all{ |product| product.category == category}
    end

    def percentage_occupied
        (total_number_of_products.to_f / capacity * 100).round(2)
    end

    def sorted_products_by_quantity
        @products.sort_by{ |product| product.quantity }.reverse
    end

end