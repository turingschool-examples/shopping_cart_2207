require 'rspec'
require './lib/product'
require './lib/shopping_cart'

describe ShoppingCart do
  context 'Iteration 2' do

    it 'exists' do
      cart = ShoppingCart.new("King Soopers", "30items")
      expect(cart).to be_instance_of(ShoppingCart)
    end

    it 'has attributes' do
      cart = ShoppingCart.new("King Soopers", "30items")
      expect(cart.name).to eq("King Soopers")
      expect(cart.capacity).to eq("30items")
    end

    it 'defaults with no products in the cart at start' do
      cart = ShoppingCart.new("King Soopers", "30items")
      expect(cart.products).to eq([])
    end

    it 'can add to the products in the cart' do
      cart = ShoppingCart.new("King Soopers", "30items")
      product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
      product2 = Product.new(:meat, 'chicken', 4.50, '2')
      cart.add_product(product1)
      cart.add_product(product2)
      expect(cart.products).to eq([product1,product2])
    end

    it 'can show the details of the cart' do
      cart = ShoppingCart.new("King Soopers", "30items")
      expect(cart.details).to eq({name: "King Soopers", capacity: 30})
    end
  end

  context 'Iteration 3' do

    it 'can show total number of items in cart' do
      cart = ShoppingCart.new("King Soopers", "30items")
      product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
      product2 = Product.new(:meat, 'chicken', 4.50, '2')
      product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
      cart.add_product(product1)
      cart.add_product(product2)
      cart.add_product(product3)
      expect(cart.total_number_of_products).to eq(13)
    end

    it 'can check if cart is full' do
      cart = ShoppingCart.new("King Soopers", "30items")
      product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
      product2 = Product.new(:meat, 'chicken', 4.50, '2')
      product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
      cart.add_product(product1)
      cart.add_product(product2)
      cart.add_product(product3)
      expect(cart.is_full?).to be(false)
      product4 = Product.new(:produce, 'apples', 0.99, '20')
      cart.add_product(product4)
      expect(cart.is_full?).to be(true)
    end

    it 'can show products by category' do
      cart = ShoppingCart.new("King Soopers", "30items")
      product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
      product2 = Product.new(:meat, 'chicken', 4.50, '2')
      product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
      product4 = Product.new(:produce, 'apples', 0.99, '20')
      cart.add_product(product1)
      cart.add_product(product2)
      cart.add_product(product3)
      cart.add_product(product4)
      expect(cart.products_by_category(:paper)).to eq([product1,product3])
    end
  end

  context 'Iteration 4' do

    it 'can calculate percentage of cart occupied' do
      cart = ShoppingCart.new("King Soopers", "30items")
      product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
      product2 = Product.new(:meat, 'chicken', 4.50, '2')
      product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
      cart.add_product(product1)
      cart.add_product(product2)
      cart.add_product(product3)
      expect(cart.percentage_occupied).to eq(43.33)
    end

    it 'can sort products by quantity' do
      cart = ShoppingCart.new("King Soopers", "30items")
      product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
      product2 = Product.new(:meat, 'chicken', 4.50, '2')
      product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
      product4 = Product.new(:produce, 'apples', 0.99, '20')
      cart.add_product(product1)
      cart.add_product(product2)
      cart.add_product(product3)
      cart.add_product(product4)
      expect(cart.sorted_products_by_quantity).to eq([product4,product1,product2,product3])
    end

    xit 'can show a product breakdown of the cart' do
      cart = ShoppingCart.new("King Soopers", "30items")
      product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
      product2 = Product.new(:meat, 'chicken', 4.50, '2')
      product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
      product4 = Product.new(:produce, 'apples', 0.99, '20')
      cart.add_product(product1)
      cart.add_product(product2)
      cart.add_product(product3)
      cart.add_product(product4)
      expect(cart.product_breakdown).to eq()
    end

  end
end