require 'rspec'
require './lib/product'
require './lib/shopping_cart'
require 'pry'

describe ShoppingCart
  context 'Iteration 2' do 
    before :each do
      @cart = ShoppingCart.new("King Soopers", "30items")
    end

    it 'is an instance of shopping_cart' do
      expect(@cart).to be_an_instance_of ShoppingCart
    end

    it 'has a name' do

      expect(@cart.name).to eq "King Soopers"
    end

    it 'has a quantity of items' do

      expect(@cart.capacity).to eq 30
    end

    it 'has an empty array of Products by default' do 
      
      expect(@cart.products).to eq []
    end

    it 'can have have products added to array of products' do
      product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
      product2 = Product.new(:meat, 'chicken', 4.50, '2')
      
      @cart.add_product(product1)
      @cart.add_product(product2)

      expect(@cart.products).to eq [product1, product2]
    end

    it 'demonstrates the details of the cart' do

      expect(@cart.details).to eq(name: "King Soopers", capacity: 30)
    end

    it 'counts products in the cart' do
      product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
      product2 = Product.new(:meat, 'chicken', 4.50, '2')
      product3 = Product.new(:paper, 'tissue paper', 1.25, '1')

      @cart.add_product(product1)
      @cart.add_product(product2)
      @cart.add_product(product3)
      expect(@cart.total_number_of_products).to eq 13
    end

    it 'has can fill up' do
      product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
      product2 = Product.new(:meat, 'chicken', 4.50, '2')
      product3 = Product.new(:paper, 'tissue paper', 1.25, '1')

      @cart.add_product(product1)
      @cart.add_product(product2)
      @cart.add_product(product3)

      expect(@cart.is_cart_full?).to eq false

      product4 = Product.new(:produce, 'apples', 0.99, '20')
      @cart.add_product(product4)

      expect(@cart.is_cart_full?).to eq true
    end

    it 'finds products by category' do
      product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
      product2 = Product.new(:meat, 'chicken', 4.50, '2')
      product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
      product4 = Product.new(:produce, 'apples', 0.99, '20')

      @cart.add_product(product1)
      @cart.add_product(product2)
      @cart.add_product(product3)
      @cart.add_product(product4)

      expect(cart.products_by_category(:paper)).to eq product1, product3
    end
  end
