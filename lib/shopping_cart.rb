class ShoppingCart
    attr_reader :name,
                :capacity,
                :products
    def initialize(name, capacity)
        @name = name
        @capacity = capacity[0..1].to_i
        @products = []
    end

    def add_product(product)
        products << product
    end

    def details
        {name: @name, capacity: @capacity}
    end

    def total_number_of_products
        @products.sum {|product| product.quantity}
    end

    def is_full?
        total_number_of_products >= @capacity
    end

    def products_by_category(search_category)
        @products.select {|product| product.category == search_category}
    end

    def percentage_occupied
        ((total_number_of_products.to_f / @capacity.to_f) * 100).round(2)
    end

    def sorted_products_by_quantity
        @products.sort_by {|product| product.quantity}.reverse!
    end

    def product_breakdown
        # curr_categories = []
        # @products.each do |product|
        #     curr_categories << product.category
        # end

        # curr_categories = curr_categories.uniq

        # final_hash = {}
        # @curr_categories.each do |cat|
        #     final_hash << [cat: products_by_category(cat)]
        # end
        # final_hash

        detail_breakdown = {meat: products_by_category(:meat), paper: products_by_category(:paper), produce: products_by_category(:produce)}

    end
end