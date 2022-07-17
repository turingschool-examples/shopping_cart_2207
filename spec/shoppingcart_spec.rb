require 'rspec'
require './lib/product'
require './lib/shoppingcart'

describe ShoppingCart do
  context 'Iteration 2' do
    it 'Cart exists' do
      cart = ShoppingCart.new("King Soopers", "30items")

      expect(cart).to be_an_instance_of ShoppingCart
    end

    it 'Cart has a name' do
        cart = ShoppingCart.new("King Soopers", "30items")
  
        expect(cart.name).to eq('King Soopers')
    end

    it 'Cart has a capacity' do
        cart = ShoppingCart.new("King Soopers", "30items")
  
        expect(cart.capacity).to eq(30)
    end

    it 'Cart has no products' do
        cart = ShoppingCart.new("King Soopers", "30items")
  
        expect(cart.products).to eq([])
    end

    it 'Cart has products' do
        cart = ShoppingCart.new("King Soopers", "30items")

        product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
        product2 = Product.new(:meat, 'chicken', 4.50, '2') 

        cart.add_product(product1)
        cart.add_product(product2)
  
        expect(cart.products).to eq([product1, product2])
    end

    it 'Cart has details' do
        cart = ShoppingCart.new("King Soopers", "30items")

        product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
        product2 = Product.new(:meat, 'chicken', 4.50, '2') 

        cart.add_product(product1)
        cart.add_product(product2)

        expect(cart.details).to eq({name: "King Soopers", capacity: 30})
    end

    it 'Cart has total number of products' do
        cart = ShoppingCart.new("King Soopers", "30items")

        product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
        product2 = Product.new(:meat, 'chicken', 4.50, '2') 
        product3 = Product.new(:paper, 'tissue paper', 1.25, '1')

        cart.add_product(product1)
        cart.add_product(product2)
        cart.add_product(product3)

        expect(cart.total_number_of_products).to eq(13)
    end

   it 'Cart is not full' do
        cart = ShoppingCart.new("King Soopers", "30items")

        product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
        product2 = Product.new(:meat, 'chicken', 4.50, '2') 
        product3 = Product.new(:paper, 'tissue paper', 1.25, '1')

        cart.add_product(product1)
        cart.add_product(product2)
        cart.add_product(product3)

        expect(cart.is_full?).to eq(false)
    end

    it 'Cart is full' do
        cart = ShoppingCart.new("King Soopers", "30items")

        product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
        product2 = Product.new(:meat, 'chicken', 4.50, '2') 
        product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
        product4 = Product.new(:produce, 'apples', 0.99, '20')

        cart.add_product(product1)
        cart.add_product(product2)
        cart.add_product(product3)
        cart.add_product(product4)

        expect(cart.is_full?).to eq(true)
    end

    it 'Cart shows products by category' do
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
