require 'rspec'
require './lib/shopping_cart'
require './lib/product'

describe ShoppingCart do
  context 'Iteration 2' do
    it 'exists' do
      cart = ShoppingCart.new("King Soopers", "30items")

      expect(cart).to be_an_instance_of(ShoppingCart)
    end

    it 'has a name' do
      cart = ShoppingCart.new("King Soopers", "30items")

      expect(cart.name).to eq("King Soopers")
    end

    it 'has a capacity' do
      cart = ShoppingCart.new("King Soopers", "30items")

      expect(cart.capacity).to eq(30)
    end

    it 'has an array for products' do
      cart = ShoppingCart.new("King Soopers", "30items")

      expect(cart.products).to eq([])
    end

    it 'can add products to itself' do
      cart = ShoppingCart.new("King Soopers", "30items")
      product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
      product2 = Product.new(:meat, 'chicken', 4.50, '2')
      cart.add_product(product1)
      cart.add_product(product2)

      expect(cart.products).to eq([product1, product2])
    end

    it 'can return details about itself' do
      cart = ShoppingCart.new("King Soopers", "30items")

      expect(cart.details).to eq({name: "King Soopers", capacity: 30})
    end
  end

  context 'Iteration 3' do
    before :each do
      @cart = ShoppingCart.new("King Soopers", "30items")
      @product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
      @product2 = Product.new(:meat, 'chicken', 4.50, '2')
      @product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
      @product4 = Product.new(:produce, 'apples', 0.99, '20')
    end

    it 'can return the total number of products' do
      @cart.add_product(@product1)
      @cart.add_product(@product2)
      @cart.add_product(@product3)

      expect(@cart.total_number_of_products).to eq(13)
    end

    it 'can check whether it is full' do
      @cart.add_product(@product1)
      @cart.add_product(@product2)
      @cart.add_product(@product3)

      expect(@cart.is_full?).to eq(false)

      @cart.add_product(@product4)

      expect(@cart.is_full?).to eq(true)
    end

    it 'can return products_by_category' do
      @cart.add_product(@product1)
      @cart.add_product(@product2)
      @cart.add_product(@product3)
      @cart.add_product(@product4)

      expect(@cart.products_by_category(:paper)).to eq([@product1, @product3])
    end
  end
end
