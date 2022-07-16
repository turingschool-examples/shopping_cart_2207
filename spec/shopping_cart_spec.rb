require 'rspec'
require './lib/product'
require './lib/shopping_cart'

describe ShoppingCart do
  context 'Iteration 2' do
    it 'ShoppingCart exists' do
      cart = ShoppingCart.new

      expect(cart).to be_an_instance_of ShoppingCart
    end


  end
end
