require './lib/product'
require './lib/shopping_cart'

RSpec.describe ShoppingCart do
  context 'iteration 2' do
    before :each do
      @cart = ShoppingCart.new("King Soopers", "30items")
      @product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
      @product2 = Product.new(:meat, 'chicken', 4.50, '2')
      @product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
    end

    it 'exists' do
      expect(@cart).to be_a(ShoppingCart)
    end

    it 'has attributes' do
      expect(@cart.name).to eq("King Soopers")
      expect(@cart.capacity).to eq("30items")
      expect(@cart.products).to eq([])
    end

    it 'has add_product method' do
      @cart.add_product(@product1)
      @cart.add_product(@product2)
      expect(@cart.products).to eq([@product1, @product2])
    end

    it 'has details' do
      expect(@cart.details).to eq({name: "King Soopers", capacity: 30})
    end

    xit 'has total_number_of_products method' do
      @cart.add_product(@product1)
      @cart.add_product(@product2)
      @cart.add_product(@product3)
      expect(@cart.total_number_of_products).to eq(13)
      expect(@cart.is_full?).to eq(false)
    end
  end
end