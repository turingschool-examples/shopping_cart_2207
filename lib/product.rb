class Product

attr_reader :category, :name, :unit_price, :quantity
def initialize (category, name, unit_price, quantity)
  @category = category
  @name = name
  @unit_price = unit_price
  @quantity = quantity.to_i
  @is_horded = false
end

def total_price
  @unit_price * @quantity
end

def hoarded?
  @is_horded
end

def hoard
  @is_horded = true
end

end
