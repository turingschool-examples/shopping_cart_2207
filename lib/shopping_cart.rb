class ShoppingCart
    attr_reader :name,
                :capacity,
                :products
                
    def initialize(name, capacity)
        @name = name 
        @capacity = capacity.delete("items")
        @products = []
        @is_full = false
    end

    def add_product(product)
        @products << product
    end

    def details
        cart_details ={}
        cart_details[:name] = name
        cart_details[:capacity] = capacity.to_i
        cart_details
    end

    def is_full?
        if total_number_of_products >= 30
            true
        else
            false
        end
    end

    def total_number_of_products
        total_quantity = 0
        @products.each do |product|
            product.quantity 
            total_quantity += product.quantity
        end
         total_quantity
       
    end

    def products_by_category(category)
        @products.find_all {|product| product.category == category}
    end
end