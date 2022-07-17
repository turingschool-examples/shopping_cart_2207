require 'spec'
require './lib/shopping_cart'

describe ShoppingCart
  context 'Iteration 2' do
    it 'ShoppingCart exists' do
      shopping_cart = ShoppingCart.new('King Soopers', '30items')

      expect(shopping_cart).to be_an_instance_of(ShoppingCart)
    end

    it 'ShoppingCart has a name' do
      shopping_cart = ShoppingCart.new('King Soopers', '30items')

      expect(shopping_cart.name).to eq('King Soopers')
    end

    it 'ShoppingCart has a capacity' do
      shopping_cart = ShoppingCart.new('King Soopers', '30items')

      expect(shopping_cart.capacity).to eq(30)
    end

    it 'ShoppingCart has products' do
      shopping_cart = ShoppingCart.new('King Soopers', '30items')

      expect(shopping_cart.products).to eq([])
    end

  end
