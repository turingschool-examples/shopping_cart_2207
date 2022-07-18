require './lib/shopping_cart'

  describe ShoppingCart do

    it "exists" do
      cart = ShoppingCart.new("King Soopers", 30)
      expect(cart).to be_instance_of(ShoppingCart)
    end

    it "has name" do
      cart = ShoppingCart.new("King Soopers", 30)
      expect(cart.name).to eq('King Soopers')
    end

    it "has capacity" do
      cart = ShoppingCart.new("King Soopers", 30)
      expect(cart.capacity).to eq(30)
    end

    it "has products" do
      cart = ShoppingCart.new("King Soopers", 30)
      expect(cart.products).to eq([])
    end

    it "can add products" do
      cart = ShoppingCart.new("King Soopers", 30)
      product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
      product2 = Product.new(:meat, 'chicken', 4.50, '2')
      cart.add_product(product1)
      cart.add_product(product2)
      # require "pry"; binding.pry
      expect(cart.products).to eq(@products)
    end

    xit "can list details" do

      expect(cart.details).to eq(cart)
    end
  end
