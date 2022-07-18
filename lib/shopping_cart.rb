class ShoppingCart

    attr_reader :name, :capacity, :products

    def initialize (name, capacity)
        @name = name
        @capacity = capacity.delete("^0-9").to_i
        @products = []
    end 

    def add_product(product)
        @products << product
    end

    def details
       {name: @name, capacity: @capacity}
    end 

    def total_number_of_products
        count = 0
        @products.each do |product|
            count += product.quantity
        end
        count
    end

    def is_full?
        @capacity < total_number_of_products
    end

    def products_by_category(category)
        @products.find_all do |product| 
            product.category == category
        end
    end
         





end
