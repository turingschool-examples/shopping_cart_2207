require './lib/product'
require './lib/shopping_cart'

RSpec.describe ShoppingCart do
   it 'exists' do
   cart = ShoppingCart.new("King Soopers", "30items")
   expect(cart).to be_instance_of(ShoppingCart)
   expect(cart.name).to eq("King Soopers")
   end

   it 'has a capacity' do
      cart = ShoppingCart.new("King Soopers", "30items")
      expect(cart.capacity).to eq("30items")
   end

   it 'has an empty array for products' do
      cart = ShoppingCart.new("King Soopers", "30items")
      expect(cart.products).to eq([])
   end

   it "can add product" do
      cart = ShoppingCart.new("King Soopers", "30items")
      product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
      product2 = Product.new(:meat, 'chicken', 4.50, '2')
      cart.add_product(product1)
      cart.add_product(product2)
   end

   it 'has details' do
      cart = ShoppingCart.new("King Soopers", "30items")
      product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
      product2 = Product.new(:meat, 'chicken', 4.50, '2')
      cart.products
      expect(cart.details).to eq({name: "King Soopers", capacity: "30items"})
   end

   it 'can be full' do
      cart = ShoppingCart.new("King Soopers", "30items")
      product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
      product2 = Product.new(:meat, 'chicken', 4.50, '2')
      product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
      cart.add_product(product1)
      cart.add_product(product2)
      cart.add_product(product3)
      expect(cart.total_number_of_products).to be 13
      expect(cart.is_full?).to be false
   end

   it 'has another product' do
      cart = ShoppingCart.new("King Soopers", "30items")
      product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
      product2 = Product.new(:meat, 'chicken', 4.50, '2')
      product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
      product4 = Product.new(:produce, 'apples', 0.99, '20')
      cart.add_product(product4)
      expect(cart.is_full?).to be true
   end

   it 'has products by category' do
      cart = ShoppingCart.new("King Soopers", "30items")
      product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
      product2 = Product.new(:meat, 'chicken', 4.50, '2')
      product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
      product4 = Product.new(:produce, 'apples', 0.99, '20')
      expect(cart.products_by_category(:paper)).to eq(category)
   end
end