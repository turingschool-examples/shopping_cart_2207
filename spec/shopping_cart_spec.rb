require './lib/product'
require './lib/shopping_cart'

RSpec.describe ShoppingCart do
  context 'iteration 2' do
    before :each do
      @cart = ShoppingCart.new("King Soopers", "30items")
      @product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
      @product2 = Product.new(:meat, 'chicken', 4.50, '2')
      @product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
      @product4 = Product.new(:produce, 'apples', 0.99, '20')
    end

    it 'exists' do
      expect(@cart).to be_a(ShoppingCart)
    end

    it 'has attributes' do
      expect(@cart.name).to eq("King Soopers")
      expect(@cart.capacity).to eq("30items")
      expect(@cart.products).to eq([])
    end
  end

  context 'iteration 3' do
    it 'has add_product method' do
      @cart.add_product(@product1)
      @cart.add_product(@product2)
      expect(@cart.products).to eq([@product1, @product2])
    end

    it 'has details' do
      expect(@cart.details).to eq({name: "King Soopers", capacity: 30})
    end

    it 'has total_number_of_products method' do
      @cart.add_product(@product1)
      @cart.add_product(@product2)
      @cart.add_product(@product3)
      expect(@cart.total_number_of_products).to eq(13)
      expect(@cart.is_full?).to eq(false)
      @cart.add_product(@product4)
      expect(@cart.is_full?).to eq(true)
    end

    it 'has products_by_category method' do
      @cart.add_product(@product1)
      @cart.add_product(@product2)
      @cart.add_product(@product3)
      @cart.add_product(@product4)
      expect(@cart.products_by_category(:paper)).to eq([@product1, @product3])
    end
  end

  context 'iteration 4' do
    it 'has percentage_occupied method' do
      @cart.add_product(@product1)
      @cart.add_product(@product2)
      @cart.add_product(@product3)
      expect(@cart.percentage_occupied).to eq(43.33)
    end

    it 'has sorted_products_by_quantity method' do
      @cart.add_product(@product1)
      @cart.add_product(@product2)
      @cart.add_product(@product3)
      @cart.add_product(@product4)
      expect(@cart.sorted_products_by_quantity).to eq([@product4, @product1, @product2, @product3])
    end

    it 'had product_breakdown method' do
      @cart.add_product(@product1)
      @cart.add_product(@product2)
      @cart.add_product(@product3)
      @cart.add_product(@product4)
      expect(@cart.product_breakdown).to be_a(Hash)
    end
  end
end