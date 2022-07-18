  class Product
   attr_reader :category, :name, :unit_price, :quantity, :hoard
    
    def initialize(category, name, unit_price, quantity, hoard = false)
      @category = category
      @name = name
      @unit_price = unit_price 
      @quantity = quantity.to_i
      @hoard = hoard
    end

    def total_price
      unit_price * quantity
    end

    def is_hoarded? 
      @hoard      
    end
  
    def hoard
      @hoard = true
    end
  end
