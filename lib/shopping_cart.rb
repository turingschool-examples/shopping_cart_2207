class ShoppingCart

attr_reader :name, :capacity, :products, :details

    def initialize(name, capacity)
        @name = name
        @capacity = capacity.to_i
        @products = []
        @details = {
                name: @name,
                capacity: @capacity
                    }
    end

    def add_product(product)
        @products << product
    end

    def total_number_of_products
        total_product_qty = []
        @products.each do |item|
            total_product_qty << item.quantity
        end
        total_product_qty.sum
    end

    def is_full?
        total_number_of_products >= @capacity
    end

    def products_by_category(category)
@products.find_all do |item|
    item.category == category
end
end

def percentage_occupied
# require "pry"; binding.pry
    product_quantities = []
    @products.each do |product|
        product_quantities << product.quantity
    end
((product_quantities.sum / capacity.to_f) * 100).round(2)
end


end
