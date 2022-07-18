class ShoppingCart
  attr_reader :name, :capacity, :products

  def initialize(name, capacity)
    @name = name
    @capacity = capacity[/\d+/].to_i
    @products = []
  end

  def add_product(item)
    @products << item
  end

  def details
    Hash.new


  end

  def total_number_of_products

  end

  def is_full?
    if total_number_of_products > @capacity
    true
    else
    false
    end
  end

  def products_by_category
    catarr=[]
    @products.each do |product|
      if product.include?(:paper)==true
        catarr << product
      end
    end
    catarr
  end

  def percentage_occupied
    (total_number_of_products/@capacity) * 100
  end


end
