require './lib/product'
require './lib/shopping_cart'

RSpec.describe ShoppingCart do

  before :each do
    @cart = ShoppingCart.new("King Soopers", "30items")
    @product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    @product2 = Product.new(:meat, 'chicken', 4.50, '2')
  end

  it 'can name store currently shopping at' do
    expect(@cart.name).to eq('King Soopers')
  end

  it 'can return cart capacity' do
    expect(@cart.capacity).to eq(30)
  end

  xit 'can return products in cart' do
    expect(@cart.products).to eq([])
  end

  xit 'can count and return info for products in cart' do
    @cart.add_product(@product1)
    @cart.add_product(@product2)

    expect(@cart.products.count).to eq(2)
    expect(@cart.details).to eq({name: "King Soopers", capacity: 30})
  end
end
