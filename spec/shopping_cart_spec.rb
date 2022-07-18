require 'rspec'
require './lib/product'
require './lib/shopping_cart'

describe ShoppingCart do
  context 'Iteration 2' do
    it 'ShoppingCart exists' do
      cart = ShoppingCart.new("King Soopers", "30items")

      expect(cart).to be_instance_of(ShoppingCart)
    end

    it 'has a name' do
      cart = ShoppingCart.new("King Soopers", "30items")

      expect(cart.name).to eq('King Soopers')
    end

    it 'has a cart capacity' do
      cart = ShoppingCart.new("King Soopers", "30items")

      expect(cart.capacity).to be(30)
    end
  
    it 'has products' do 
      cart = ShoppingCart.new("King Soopers", "30items")

      expect(cart.products).to eq([])
    end
  
    it 'can add products to the cart' do
      cart = ShoppingCart.new("King Soopers", "30items")
      product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
      product2 = Product.new(:meat, 'chicken', 4.50, '2')  

      cart.add_product(product1)
      cart.add_product(product2)

      expect(cart.products).to eq ([product1, product2])
    end

    it 'can store details in a hash' do
      cart = ShoppingCart.new("King Soopers", "30items")

      expect(cart.details.keys).to eq([:name, :capacity])
      expect(cart.details.values).to eq(["King Soopers", 30])
    end    
  end

  context 'Iteration 3' do
    it 'can count the total number of prodcuts' do
      cart = ShoppingCart.new("King Soopers", "30items")
      product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
      product2 = Product.new(:meat, 'chicken', 4.50, '2') 
      product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
      product4 = Product.new(:produce, 'apples', 0.99, '20')

      cart.add_product(product1)
      cart.add_product(product2)
      cart.add_product(product3)

      expect(cart.total_number_of_products).to eq(13)
      expect(cart.is_full?).to be(false)

      cart.add_product(product4)

      expect(cart.is_full?) .to be(true)
    end

    it ' can group products by category' do
      cart = ShoppingCart.new("King Soopers", "30items")
      product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
      product2 = Product.new(:meat, 'chicken', 4.50, '2') 
      product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
      product4 = Product.new(:produce, 'apples', 0.99, '20')

      cart.add_product(product1)
      cart.add_product(product2)
      cart.add_product(product3)
      cart.add_product(product4)

      expect(cart.products_by_category(:paper)).to eq([product1, product3])
    end
  end
end
