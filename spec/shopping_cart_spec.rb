require './lib/product'
require './lib/shopping_cart'

RSpec.describe do

  before :each do
    @cart = ShoppingCart.new("King Soopers", "30items")
    @product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    @product2 = Product.new(:meat, 'chicken', 4.50, '2')
  end

  it 'exists' do
    expect(@cart).to be_an_instance_of ShoppingCart
  end

  xit 'has a capacity' do
    expect(@cart.capacity).to eq(30)
  end

  xit 'initializes with an empty products array' do
    expect(@cart.products).to be_empty
  end

  xit 'can add products to the cart' do
    @cart.add_product(@product1)
    @cart.add_product(@product2)
    expect(cart.products).to eq([@product1, @product2])
  end

  xit 'has a method to see cart name and capacity as a hash' do
    expect(@cart.details).to eq({name: "King Soopers", capacity: 30})
  end



end
