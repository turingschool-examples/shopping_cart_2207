class ShoppingCart
    attr_reader :name, :capacity, :cart, :products, :details, :category, :total_number_of_products

    def initialize(name, capacity)
        @name = name
        @capacity = capacity
        @cart = cart
        @products = []
        @details = {:name => @name, :capacity => @capacity}
           
    end

    def add_product(product)
        @products << product    
    end
    
    def is_full?
        @quantity.map do |quantity|
            @quantity << quantity
            @quantity += product.quantity
            if @total_quantity < 30
                return false
            end
        end
    end

    def products_by_category(product)
        product.category == []
        @products.each do |product|
            category << product
        end
        category
    end
end