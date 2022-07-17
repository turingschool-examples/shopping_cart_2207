require './lib/product'
require './lib/shopping_cart'

RSpec.describe ShoppingCart do
  before do
    @cart = ShoppingCart.new("King Soopers", "30items")
  end

  describe '#initialize' do
    it 'exists' do
      expect(@cart).to be_instance_of ShoppingCart
    end
  end

  describe '@name' do
    it 'has a name' do
      expect(@cart.name).to eq("King Soopers")
    end
  end

  describe '@capacity' do
    it 'has a capacity' do
      expect(@cart.capacity).to eq(30)
    end
  end

  describe '@products' do
    it 'has an empty array of products' do
      expect(@cart.products).to eq([])
    end
  end

  describe '#add_product' do
    it 'adds products to the products array' do
      @product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
      @product2 = Product.new(:meat, 'chicken', 4.50, '2')

      @cart.add_product(@product1)
      @cart.add_product(@product2)

      expect(@cart.products).to eq([@product1, @product2])
    end
  end

  describe '#details' do
    it 'returns a hash of detials' do
      expect(@cart.details).to eq({name: "King Soopers", capacity: 30})
    end
  end

  describe '#total_number_of_products' do
    it 'can total the quantity of products' do
      @product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
      @product2 = Product.new(:meat, 'chicken', 4.50, '2')
      @product3 = Product.new(:paper, 'tissue paper', 1.25, '1')

      @cart.add_product(@product1)
      @cart.add_product(@product2)
      @cart.add_product(@product3)

      expect(@cart.total_number_of_products).to eq(13)
    end
  end

  describe '#is_full?' do
    it 'knows if the cart is full' do
      @product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
      @product2 = Product.new(:meat, 'chicken', 4.50, '2')
      @product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
      @product4 = Product.new(:produce, 'apples', 0.99, '20')

      @cart.add_product(@product1)
      @cart.add_product(@product2)
      @cart.add_product(@product3)

      expect(@cart.is_full?).to be false

      @cart.add_product(@product4)

      expect(@cart.is_full?).to be true
    end
  end

  describe '#products_by_category' do
    it 'finds products by category' do
      @product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
      @product2 = Product.new(:meat, 'chicken', 4.50, '2')
      @product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
      @product4 = Product.new(:produce, 'apples', 0.99, '20')
      @cart.add_product(@product1)
      @cart.add_product(@product2)
      @cart.add_product(@product3)
      @cart.add_product(@product4)

      expect(@cart.products_by_category(:paper)).to eq([@product1, @product3])
    end
  end
end
