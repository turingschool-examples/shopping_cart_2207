require './lib/product'
require './lib/shopping_cart'

RSpec.describe Cart do

  it 'exists' do
    cart = Cart.new("King Soopers", "30items")
    
    expect(cart).to be_a(Cart)
  end

  it 'instantiates with the expected attributes' do
    cart = Cart.new("King Soopers", "30items")

    expect(cart.name).to eq("King Soopers")
    expect(cart.capacity).to eq(30)
    expect(cart.products).to eq([])
  end

  it 'can add products' do 
    cart = Cart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    cart.add_product(product1)
    cart.add_product(product2)

    expect(cart.products.length).to eq(2)
  end





end