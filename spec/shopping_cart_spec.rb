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
      expect(@cart.products).to eq([@product1, @product2])
    end

    it 'has details' do
      expect(@cart.details).to eq({name: "King Soopers", capacity: 30})
    end
  end

  context 'Iteration 3' do
    before :each do
      @cart = ShoppingCart.new("King Soopers", "30items")
      @product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
      @product2 = Product.new(:meat, 'chicken', 4.50, '2') 
      @product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
      @product4 = Product.new(:produce, 'apples', 0.99, '20')
      @cart.add_product(@product1)
      @cart.add_product(@product2)
      @cart.add_product(@product3)
    end

    it 'counts total products' do
      expect(@cart.total_number_of_products).to eq(13)
    end

    it 'checks to see if full' do
      expect(@cart.is_full?).to eq(false)
      @cart.add_product(@product4)
      expect(@cart.is_full?).to eq(true)
    end

    it 'can find products by category' do
      expect(@cart.products_by_category(:paper)).to eq([@product1, @product3])
    end
  end

  context 'Iteration 4' do
    before :each do
      @cart = ShoppingCart.new("King Soopers", "30items")
      @product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
      @product2 = Product.new(:meat, 'chicken', 4.50, '2') 
      @product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
      @product4 = Product.new(:produce, 'apples', 0.99, '20')
      @cart.add_product(@product1)
      @cart.add_product(@product2)
      @cart.add_product(@product3)
    end
    
    it 'can find % occupied' do
      expect(cart.percentage_occupied).to eq(43.33)
    end

    it 'can sort products by quantity' do
      expect(cart.products_sorted_by_quantity).to eq([@product4,@product1,@product2,@product3])
    end

    it 'breaks down products by category' do
      result = {
        :meat => [@product2],
        :paper => [@product1, @product3],
        :produce => [@product4]
      }
      expect(cart.product_breakdown).to eq(result)
    end
end
