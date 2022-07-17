class Product

    attr_reader :category, 
                :name, 
                :quantity, 
                :unit_price,
                :total_price,
                :hoarded
    def initialize(category, name, unit_price, quantity)
        @category = category
        @name = name
        @quantity = quantity.to_i
        @unit_price = unit_price
        @total_price = unit_price * quantity.to_i
        @hoarded = false
    end

    def is_hoarded?
        @hoarded
    end

    def hoard
        @hoarded = true
    end
end