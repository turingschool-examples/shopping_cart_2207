require './lib/product'
require './lib/shopping_cart'

describe ShoppingCart do
  context 'Iteration 2' do
    it 'exists' do
      cart = ShoppingCart.new("King Soopers", "30items")
  
      expect(cart).to be_an_instance_of ShoppingCart
    end
  
    it 'has attributes' do
      cart = ShoppingCart.new("King Soopers", "30items")
  
      expect(cart.name).to eq("King Soopers") 
      expect(cart.capacity).to eq(30)
      expect(cart.products).to eq([])
    end 
  end
end