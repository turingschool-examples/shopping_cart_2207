require 'rspec'
require './lib/shopping_cart'

describe ShoppingCart do
  context 'Iteration 2' do
    it 'Shopping Cart exists' do
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

    it 'starts with no products in it' do
      cart = ShoppingCart.new("King Soopers", "30items")

      expect(cart.products).to eq([])
    end
  end
end
