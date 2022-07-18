class Product
    attr_reader :category, :name, :unit_price, :quantity
    def initialize(category, name, price, quantity)
        @category = category
        @name = name
        @unit_price = price
        @quantity = quantity.to_f
        @hoarded = false
    end


    def total_price
        @quantity * @unit_price
    end


    def hoarded?
        @hoarded
    end

    def hoard
        @hoarded = true
    end

end