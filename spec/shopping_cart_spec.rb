require 'rspec'
require './lib/shopping_cart'

describe ShoppingCart do
  context 'Iteration 2' do
    it 'Shopping Cart exists' do
      shopping_cart = ShoppingCart.new("King Soopers", "30items")

      expect(shopping_cart).to be_an_instance_of ShoppingCart
    end

    it 'Shopping Cart has a name' do
      shopping_cart = ShoppingCart.new("King Soopers", "30items")

      expect(shopping_cart.name).to eq "King Soopers"
    end

    it 'Shopping Cart has a capacity' do
      shopping_cart = ShoppingCart.new("King Soopers", "30items")

      expect(shopping_cart.capacity).to eq 30
    end

    it 'Shopping Cart can hold products' do
      shopping_cart = ShoppingCart.new("King Soopers", "30items")

      expect(shopping_cart.products).to eq []
    end

    it 'Shopping Cart can have products added' do
      shopping_cart = ShoppingCart.new("King Soopers", "30items")
      product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
      product2 = Product.new(:meat, 'chicken', 4.50, '2')

      shopping_cart.add_product(product1)
      shopping_cart.add_product(product2)

      expect(shopping_cart.products).to eq [product1, product2]
    end

    it "Shopping Cart can provide its details" do
      shopping_cart = ShoppingCart.new("King Soopers", "30items")

      expect(shopping_cart.details).to eq ({name: "King Soopers", capacity: 30})
    end

  end
end
