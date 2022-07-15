require './lib/product'
require './lib/shopping_cart'

describe ShoppingCart do
  context 'Iteration 2' do
    it 'exists' do
      cart = ShoppingCart.new("King Soopers", "30items")
  
      expect(cart).to be_an_instance_of ShoppingCart
    end
  
    it 'has attributes' do
      cart = ShoppingCart.new("King Soopers", "30items")
  
      expect(cart.name).to eq("King Soopers") 
      expect(cart.capacity).to eq(30)
      expect(cart.products).to eq([])
    end

    it 'can put products in cart' do
      cart = ShoppingCart.new("King Soopers", "30items")
      product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
      product2 = Product.new(:meat, 'chicken', 4.50, '2')
  
      cart.add_product(product1)
      cart.add_product(product2)
  
      expect(cart.products).to eq([product1, product2])
    end

    it 'can give its details' do
      cart = ShoppingCart.new("King Soopers", "30items")
  
      expect(cart.details).to eq({ name: "King Soopers", capacity: 30 })
    end
  end

  context 'Iteration 2' do
    it 'can give total number of products in cart' do
      cart = ShoppingCart.new("King Soopers", "30items")
      product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
      product2 = Product.new(:meat, 'chicken', 4.50, '2')
      product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
  
      cart.add_product(product1)
      cart.add_product(product2)
      cart.add_product(product3)
  
      expect(cart.total_number_of_products).to eq(13)
    end
  
    it 'can tell if full' do
      cart = ShoppingCart.new("King Soopers", "30items")
      product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
      product2 = Product.new(:meat, 'chicken', 4.50, '2')
      product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
      product4 = Product.new(:produce, 'apples', 0.99, '20')
  
      cart.add_product(product1)
      cart.add_product(product2)
      cart.add_product(product3)
  
      expect(cart.is_full?).to eq(false)
  
      cart.add_product(product4)
  
      expect(cart.is_full?).to eq(true)
    end
  
    it 'can output products in cart by category' do
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