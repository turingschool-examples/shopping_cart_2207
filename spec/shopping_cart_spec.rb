require './lib/product'
require './lib/shopping_cart'

RSpec.describe ShoppingCart do
  let(:cart) { ShoppingCart.new("King Soopers", "30items") }

  it 'should be a class' do
    expect(cart).to be_an_instance_of ShoppingCart
  end


end