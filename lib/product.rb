class Product
  attr_reader :category,
              :name,
              :unit_price

  def initialize(category, name, price, thing_4)
    @category = category
    @name = name
    @unit_price = price
  end

end
