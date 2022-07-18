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
  end
