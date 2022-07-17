require 'rspec'
require './lib/shopping_cart'

describe ShoppingCart do
  context 'Iteration 2' do
    before :each do
      @cart = ShoppingCart.new("King Soopers", "30items")
      @product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
      @product2 = Product.new(:meat, 'chicken', 4.50, '2') 
    end

    it 'exists' do
      expect(@cart).to be_an_instance_of(ShoppingCart)
    end

    it 'has a name' do
      expect(@cart.name).to eq("King Soopers")
    end

    it 'has a capacity' do
      expect(@cart.capacity).to eq(30)
    end

    it 'has an initially empty array of Products' do
      expect(@cart.products).to be_a(Array)
      expect(@cart.products).to eq([])
    end

    it 'can add Products to Cart' do
      @cart.add_product(@product1)
      @cart.add_product(@product2)
      expect(@cart.products).to eq([@product1], [@product2])
    end

    it 'has details' do
      expect(@cart.details).to eq({name: "King Soopers", capacity: 30})
    end
  end
end